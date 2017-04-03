require 'my_logger'
require 'date'

class PatientsController < ApplicationController
    #password required to add patient
    #http_basic_authenticate_with name: "test", password: "test", except: [:index, :show]
    before_filter :authenticate_user! 
    before_filter :ensure_admin, :only => [:edit, :destroy] 

    
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  # http://www.korenlc.com/creating-a-simple-search-in-rails-4/
  def index
    @patients = Patient.all
    if params[:search]
        @patients = Patient.search(params[:search]).order("created_at DESC")
  else
        @patients = Patient.all.order('created_at DESC')
  end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end
    
    helper_method :sort_column, :sort_direction
  def index
    @patients = Patient.order(sort_column + " " + sort_direction)
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
      logger = MyLogger.send :new
      logger.logInformation("A new patient has been added - "+@patient.Name+" at "+Time.now.to_s)
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
    def ensure_admin
        unless current_user && current_user.admin?
            render :text => "Access Error Message", :status => :unauthorized
        end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:Name, :Date_of_Birth, :Address, :Phone_Number, :Infection, :Injury)
    end
    
    #http://railscasts.com/episodes/228-sortable-table-columns
  private
  def sort_column
    Patient.column_names.include?(params[:sort]) ? params[:sort]: "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] :"asc"
  end
end

class RequestsController < ApplicationController
  def index
      #a GET request
      #find patient by ID number (which are auto incremented on creation)
      @patient = Patient.find(params[:patient_id])
      #find ALL requests for a specific patient
      @requests = @patient.requests
  end

  def show
      #another GET request
      #find a specific request for a specific patient   
      @patient = Patient.find(params[:patient_id])
      @request = @patient.requests.find(params[:id])
  end

  def new
      @patient = Patient.find(params[:patient_id])
      #associate a request to a specific patient
      @request = @patient.requests.build
  end
  
    def create
        @patient = Patient.find(params[:patient_id])
        @request = @patient.requests.build(params.require(:request).permit(:details))
        #a POST request
        #adding the request to the specific patient
        #Note: can be done multiple times due to one-to-many relationship
        if @request.save
            redirect_to patient_request_url(@patient, @request)
        else
            render :action => "new"
        end
    end
    
  def edit
      @patient = Patient.find(params[:patient_id])
      #find a specific request for editing
      @request = @patient.requests.find(params[:id])
  end
    
    def update
        @patient = Patient.find(params[:patient_id])
        @request = Request.find(params[:id])
        #a PUT request
        #updating the specific request
        if @request.update_attributes(params.require(:request).permit(:details))
            redirect_to patient_request_url(@patient, @request)
        else
            render :action => "edit"
        end
    end
    
    def destroy
        @patient = Patient.find(params[:patient_id])
        @request = Request.find(params[:id])
        #deleting a request
        @request.destroy
        respond_to do |format|
            format.html { redirect_to patient_requests_path(@patient) }
            format.xml { head :ok }
        end
    end
end

#to run this - navigate to 'lib' folder
#type 'ruby patient.rb'
load 'patient_observer.rb'
class Patient 
    
    attr_reader :maxlengthofname, :observer
    attr_accessor :name, :observer
    
    def initialize(name, maxlengthofname)
        @name = name
        @maxlengthofname = maxlengthofname
        @observer = PatientObserver.new
     end

    def update_name(name)
        @name = name
       notify_observer
     end

    private
        def notify_observer
        @observer.notify(self)
     end
    
    s = Patient.new "Conor",10
    puts s.inspect
    s.update_name("Alan")
    s.update_name("BarryJoeBobby")
    s.update_name("Chaz")
    s.update_name("Daithi")
    s.update_name("Eugene-Draxler")

end

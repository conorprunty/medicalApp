class PatientObserver
    def notify(patient)
        if patient.name.length >= patient.maxlengthofname
            puts "Name is: #{patient.name}\n  Must be an error: \n  Max length of name: #{patient.maxlengthofname}. \n  Name shortened to: #{patient.name[0..patient.maxlengthofname]}"
 else
            puts "Name is: #{patient.name}\n"
 end
   end
end

json.extract! patient, :id, :Name, :Date_of_Birth, :Address, :Phone_Number, :Infection, :Injury, :created_at, :updated_at
json.url patient_url(patient, format: :json)

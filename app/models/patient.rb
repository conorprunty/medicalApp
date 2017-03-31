class Patient < ApplicationRecord
    #make a one-to-many relationship between a Patient (one) and the Requests (many)
    has_many :requests
    
#    def self.search(search)
#    where("name LIKE ?", "%#{search}%") 
#    end
    
    def self.search(search_for)
        Patient.where("name LIKE ?", "%#{search_for}%")
    end
end

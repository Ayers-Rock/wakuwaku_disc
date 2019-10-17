class Address < ApplicationRecord
    belongs_to :user

    def conected_address
        self.postal_code + " " + self.postal_code + self.city_address + self.building
    end
end

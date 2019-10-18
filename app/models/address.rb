class Address < ApplicationRecord
    belongs_to :user

    def connected_address
        self.postal_code + " " + self.prefecture + " "  + self.city_address + " " + self.building
    end
end

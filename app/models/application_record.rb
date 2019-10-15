class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # validate :deadline_in_future?
end

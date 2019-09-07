class Job < ApplicationRecord
  # validations
  validates_presence_of :name

  #relationships
  belongs_to :garden

end

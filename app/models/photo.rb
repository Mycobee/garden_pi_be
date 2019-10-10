class Photo < ApplicationRecord
  belongs_to :garden
  validates_presence_of :url
end

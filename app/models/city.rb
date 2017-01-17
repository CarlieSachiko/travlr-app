class City < ActiveRecord::Base
  belongs_to :user
  has_many :accommodations
  has_many :sights
  has_many :activities
  has_many :eateries
end

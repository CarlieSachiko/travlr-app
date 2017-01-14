class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :user_trips
  has_many :invited_users, through: :user_trips, source: :user
end

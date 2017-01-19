class Trip < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :user_trips, dependent: :destroy
  has_many :invited_users, through: :user_trips, source: :user
end

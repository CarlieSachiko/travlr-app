class User < ActiveRecord::Base
  after_initialize :set_defaults

  has_many :trips
  has_many :user_trips
  has_many :invited_trips, through: :user_trips

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  private

  def set_defaults
    self.image = "/:attachment/:style/missing.png" if self.image.nil?
  end
end

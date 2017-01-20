class User < ActiveRecord::Base
  after_initialize :set_defaults

  has_many :cities, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :user_trips, dependent: :destroy
  has_many :invited_trips, through: :user_trips, source: :trip

  has_secure_password
  validates :email, presence: true, uniqueness: true, :length => {:within => 6..40}

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :banner, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  private

  def set_defaults
    self.image = "/:attachment/:style/missing.png" if self.image.nil?
  end
end

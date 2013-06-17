class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_many :notes, dependent: :destroy
  has_many :pads, dependent: :destroy

  EMAIL_RE = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :email, presence: true, format: { with: EMAIL_RE },
    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true

  has_secure_password
  before_save { email.downcase! }
  before_save :create_remember_token

  after_validation { self.errors.messages.delete(:password_digest) }

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end

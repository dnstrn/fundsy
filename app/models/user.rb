class User < ActiveRecord::Base
  has_secure_password
  # attr_accessor :password, :password_confirmation
  has_many :campaigns, dependent: :nullify
  has_many :pledges, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  before_create :generate_api_key

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def generate_api_key
    begin
      self.api_key = SecureRandom.hex(32)
    end while User.exists?(api_key: api_key)
  end

end

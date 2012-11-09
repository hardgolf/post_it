class User < ActiveRecord::Base
  
  attr_accessible :email, :password, :password_confirmation, :city, :country, :date_of_birth, 
                  :first_name, :gender, :last_name, :username, :photo
                  
  has_secure_password

  before_save { self.email.downcase! }

  has_attached_file :photo, styles: { small: "10x10>" } 

  VALID_EMAIL_REGEX = /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/i
  validates :email, presence:   true, length: { maximum: 100 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :username, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 100 }
  validates :city, length: { maximum: 50 }
  validates :country, length: { maximum: 2 }
end
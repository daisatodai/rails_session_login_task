class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence:true
  validates :email, presence:true, uniqueness:true, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation {
    if email
      email.downcase!
    end
    email = ""
  }
  has_secure_password
  validates :password, length:{ minimum:6 }
end

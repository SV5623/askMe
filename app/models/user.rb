class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nick 

  validates :email, presence: true , uniqueness: true

  def downcase_nick
    nickname.downcase!
  end
end

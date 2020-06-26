class User < ApplicationRecord
  has_many :entries
  before_save :encrypting

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  private
    def encrypting
      self.password = BCrypt::Password.create(self.password)
    end
end

class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :email, uniqueness: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
  before_save :downcase_email

  has_many :comments
  has_many :events
  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :joins, source: :event
  has_many :events_commented, through: :comments, source: :event

  private
    def downcase_email
      self.email.downcase!
    end
end

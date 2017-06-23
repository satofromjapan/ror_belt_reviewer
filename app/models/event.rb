class Event < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user

  validate :date_not_in_past
  validates :name, :city, presence: true

  def date_not_in_past
    errors.add(:date, "can't be in the past") if !date.blank? and date < Date.today
  end
end

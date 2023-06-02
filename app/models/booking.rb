
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :stuff
  validates :date, presence: true
  validate :user_cannot_be_owner

  private

  def user_cannot_be_owner
    if user == stuff.user
      errors.add(:user, "cannot be the owner of the stuff")
    end
  end
end

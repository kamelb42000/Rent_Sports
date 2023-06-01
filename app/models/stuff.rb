class Stuff < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  def accepted?
    bookings.exists?(accepted: true)
  end
end

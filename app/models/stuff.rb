class Stuff < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_one_attached :photos

  def accepted?
    bookings.exists?(accepted: true)
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

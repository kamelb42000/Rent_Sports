class Equipment < ApplicationRecord
  belongs_to :user
  belongs_to :categorie
  has_many :booking, dependent: :destroy

  validates :name, :year, :price, :description, presence: true
end

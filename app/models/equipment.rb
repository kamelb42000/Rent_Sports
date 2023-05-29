class Equipment < ApplicationRecord
  belongs_to :user
  belongs_to :categorie
  has_many :booking, dependent: :destroy
end

class Property < ApplicationRecord
  validates :property_name, :rent, :address, presence: true
  validates :rent, numericality: { only_integer: true }
  validates :rent, format: { with: /\A[0-9]+\z/ }
  has_many :stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank
end

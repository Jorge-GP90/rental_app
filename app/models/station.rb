class Station < ApplicationRecord
  validates :minutes, numericality: { only_integer: true }
  validates :minutes, format: { with: /\A[0-9]+\z/ }
  belongs_to :property, inverse_of: :stations
end

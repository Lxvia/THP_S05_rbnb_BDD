class Listing < ApplicationRecord
    belongs_to :city
    belongs_to :admin, class_name: 'User'
    has_many :reservations
    has_many :guests, through: :reservations
end

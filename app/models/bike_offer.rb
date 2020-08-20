class BikeOffer < ApplicationRecord
    validates :size, :title, presence: true
    validates :genre, presence: true, inclusion: { in: ["City Bike", "Electric Bike", "Mountain Bike", "Road Bike",  "Tandem Bike", "Cargo Bike"]}
    validates :price_per_day, inclusion: {in: 0..999}
    belongs_to :user
    has_many_attached :photos
    has_many   :bookings
    has_many   :reviews, dependent: :destroy
    
    include PgSearch::Model
    pg_search_scope :search_by_title_and_genre,
      against: [ :title, :genre ],
      using: {
        tsearch: { prefix: true }
      }
end

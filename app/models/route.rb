class Route < ApplicationRecord

  belongs_to :user
  has_many :reservations
  has_many :user_comments
  has_many :messages

  validates :departure_point , presence: true
  validates :arrival_point , presence: true
  validates :departure_time , presence: true
  validates :place_number , presence: true
  # validates :price , presence: true
  validates :passenger_or_conducter, :acceptance => {:accept => ["Passager" , "Conducteur"]}

  def format_departure_date
      self.departure_time.strftime("%d %m,%Y") unless self.departure_time.nil?
  end
end

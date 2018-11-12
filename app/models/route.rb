class Route < ApplicationRecord

  scope :departure, -> (departure_point) { where departure_point: departure_point }
  scope :arrival, -> (arrival_point) { where arrival_point: arrival_point }
  scope :date, -> (departure_date) { where departure_date: departure_date }

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

class Booking < ApplicationRecord
  belongs_to :horse
  belongs_to :user
  validates :horse_id, presence: true
  validates :user_id, presence: true

  validates_date :start_date, :after => lambda { Date.today }, :on => :create
  validates_date :end_date, :after => lambda { :start_date }, :on => :create

  def rented?
    Date.today.between?(start_date, end_date)
  end

  def available?
    if Date.today.between?(start_date, end_date)
      false
    else
      true
    end
  end

  def mark(status)
    self.status = status
    save!
  end
end

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :attachments, dependent: :destroy

  validates :name, presence: true

  def self.find_incomplete(trip)
    Task.where(trip_id: trip.id, done_at: nil)
  end

  def self.find_complete(trip)
    Task.where(trip_id: trip.id).where.not(done_at: nil)
  end
end

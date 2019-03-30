class Attachment < ApplicationRecord
  belongs_to :task

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true

end

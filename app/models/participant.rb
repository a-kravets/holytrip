class Participant < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trip
  # after_create :send_invite_email

  # private

  # def send_invite_email
  #   UserMailer.invite(self).deliver_later
  # end
end

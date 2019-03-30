# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = current_user
    UserMailer.welcome(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/invite
  def invite
    UserMailer.invite
  end

end

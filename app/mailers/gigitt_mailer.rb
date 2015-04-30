class GigittMailer < ApplicationMailer
  default from: "noreply@gigitt.com"
  def gigitt_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your Family At Gigitt')
  end
end

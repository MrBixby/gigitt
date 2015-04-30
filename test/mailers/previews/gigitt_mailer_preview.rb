# Preview all emails at http://localhost:3000/rails/mailers/gigitt_mailer
class GigittMailerPreview < ActionMailer::Preview
  def gigitt_mail_preview
    GigittMailer.gigitt_email(User.first)
  end
end

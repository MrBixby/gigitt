require 'test_helper'

class GigittMailerTest < ActionMailer::Preview
  def gigitt_mailer_preview
    gigitt_email(User.first)
  end
end

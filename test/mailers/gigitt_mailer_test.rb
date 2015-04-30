require 'test_helper'

class GigittMailerTest < ActionMailer::Preview
  Rails.application.routes.default_url_options[:host] = 'gigitt.com'
  def gigitt_mailer_preview
    gigitt_email(User.first)
  end
end

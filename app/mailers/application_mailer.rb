class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("EMAIL")
  layout "mailer"
end

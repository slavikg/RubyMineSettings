ActionMailer::Base.default_url_options[:host] = Settings.mailer.host

ActionMailer::Base.smtp_settings = {
  address:        Settings.mailer.address,
  port:           Settings.mailer.port,
  user_name:      Settings.mailer.user_name,
  password:       Settings.mailer.password,
  domain:         Settings.mailer.domain,
  authentication: :plain
}

ActionMailer::Base.delivery_method = :smtp

class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.to = [Settings.mail_stubbed_recipient]
  end
end

unless Settings.mail_send_recipient?
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end


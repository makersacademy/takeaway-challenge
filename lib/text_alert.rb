require "bundler"
Bundler.require()
# require "Envfile"

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV["TWILIO_AUTH_TOKEN"]

class TextAlert

  def send_text

  end


end

p account_sid

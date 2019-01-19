require 'twilio-ruby'

class Text
  def initialize(args)
    @takeaway_name[:name]
    @takeaway_number[:number]
    @account_sid = args[:sid]
    @auth_token = args[:auth]
  end

  def send_confirmation(number)
    @client_number = number
  end
end

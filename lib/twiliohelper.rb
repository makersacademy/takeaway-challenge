require 'twilio-ruby'
require 'twilio-configure'
# In order to use this class you need a twilio-configure.rb
# file in the lookup path of require storing:
# ACCOUNT = account_id
# TOKEN = token_number

class TwilioHelper
  include TwilioConfigure
  TWILIO_NUMBER = '+441133206410'
  MY_CELL_PHONE = '+4407445050423'

  def initialize(send_sms_for_real: true)
    @send_sms_for_real = send_sms_for_real
    load_twilio if @send_sms_for_real
  end

  def send(sms)
    if @send_sms_for_real
      @twilio.messages.create(
        from: TWILIO_NUMBER,
        to: MY_CELL_PHONE,
        body: sms
      )
    else
      sms
    end
  end

  private
  def load_twilio
    @twilio = Twilio::REST::Client.new ACCOUNT, TOKEN
  end
end

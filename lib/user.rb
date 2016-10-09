require_relative 'restaurant'
require_relative 'menu'
require_relative 'takeaway'
require 'yaml'
require 'twilio-ruby'

#
# class User
#
# attr_reader :user_info
#
#   def initialize
#    @user_info = {"name"=>"Rachael",
#      "number"=>"00447411252150"}
#   end
#
# end


require 'yaml'
require 'twilio-ruby'

module Notifier
  def self.send_sms_notifications(e)
    alert_message = "You order has been completed and should be with you shortly"
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    admin_list = {name:"Rachael", number:"00447411252150"}
    admin_list.each do |admin|
      phone_number = admin[:number]
      send_sms(client, phone_number, alert_message, image_url)
    end
  end

  def self.send_sms(client, phone_number, alert_message, image_url)
    twilio_number = ENV['TWILIO_NUMBER']
    message = client.account.messages.create(
      from: twilio_number,
      to: phone_number,
      body: alert_message
    )
    puts "An SMS notifying the last application error was "\
         "sent to #{message.to[0...-4] + "****"}"
  end

  private_class_method :send_sms
end



post '/receive_sms' do
  content_type 'text/xml'

  response = Twilio::TwiML::Response.new do |r|
    r. Message "Hey, what's up?"
  end

 response.to_xml
end

require 'twilio-ruby'
require("bundler")
Bundler.require()

class Text
  def initialize(items, total, telephone_from = "+447427567563", telephone_to = ENV["OLLIES_PHONE_NUMBER"])
    @items = items
    @total = total
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    time_next_hour = (Time.new + 3600).strftime("%I:%M %p")

    @body = "Thank you! Your order was placed and will be delivered before #{time_next_hour}. You have ordered:\n#{list_items(items)}You will be charged £#{total}0."

    @client.messages.create(
      to: telephone_to,
      from: telephone_from,
      body: @body
    )
  end

  def list_items(items)
    string = ""
    items.each do |item|
      string += "#{item[:name]} x #{item[:quantity]}\n"
    end
    string
  end

  def total
    @total
  end
end
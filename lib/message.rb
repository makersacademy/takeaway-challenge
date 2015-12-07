require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')


class Message
  attr_reader  :from, :contact

  def send(number,name) # (#ENV['DEST_PHONE'], name )
    delivery_time = del_time_calc
    credentials
    @client.account.messages.create(
      from: from, to: number,
      body: "Hi #{name}, You order will be with you before #{delivery_time},"\
        "thanks for ordering"
    )
    "Sent message to #{name}"
  end

  private
  attr_reader :from, :to, :client, :del_time_calc

  def credentials
    @from = ENV['FROM']
    @to =  ENV['TO']
    @client = Twilio::REST::Client.new ENV['TWIL_ACCOUNT_SID'],
      ENV['TWIL_AUTH_TOKEN']
  end

  def del_time_calc
    (Time.new + 3600).strftime("%H:%M")
  end

end

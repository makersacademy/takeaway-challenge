require 'twilio-ruby'
require 'dotenv/load'

class SendText
    def send
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        @time = Time.now + (1 * 60 * 60)

        @client = Twilio::REST::Client.new(account_sid, auth_token)

        message
    end

    def message
        from = 'MG2c39a918e238329baed752ecbc048529'
        to = ENV['MY_PHONE_NUMBER']

            @client.messages.create(
            from: from,
            to: to,
            body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%k:%M")}"
        )
    end
end
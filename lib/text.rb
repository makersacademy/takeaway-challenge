require 'twilio-ruby'
require './auth_credentials'

class Text
    
  $hour_later = (Time.now + 60 * 60).strftime('%H:%M')
    
  def send_text(total)
    account_sid = ACCOUNT_SID

    auth_token = AUTH_TOKEN

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: message_body(total),
        to: TO,
        from: FROM)

    message.sid
  end

  def text_response(total)
    "<Response>
      <Message>
        #{message_body(total)}
      </Message>
    </Response>"
  end  

  def send_menu(menu)
    "<Response>
      <Message>
        #{menu}
      </Message>
    </Response>"
  end

  private

  def message_body(total)
    [
      "Your order total is £#{total} and you will",
      " receive it no later than #{$hour_later}. Thank you!"
    ].join("")
  end
  
end

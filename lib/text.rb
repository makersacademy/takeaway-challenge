# require 'twilio-ruby'

class Text

  def initialize(user)

    @account_sid = 'ACdcbb47adb83bffd4fa07397cc728f460'
    @auth_token = '2f44c3e2124edd01afc8dc13ad53e23b'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    
    @from = '+447401236053' # Your Twilio number
  
    @user = user
    @time = (Time.now + 3600).strftime("%H:%M")
    send
  end

  private

  def send
    @client.messages.create(
      from: @from,
      to: @user.number,
      body: "Thank you #{@user.name}!, your order has been placed and will be deilvered before #{@time}"
      )
  end

end

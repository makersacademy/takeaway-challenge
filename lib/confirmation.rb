class Confirmation
  attr_reader :confirmation_body

  def initialize(test = false)
    @test = test
    @delivery_deadline = (Time.now + 3600).strftime("%H:%M")
    @confirmation_body = "Thank you! Your order was placed and will be delivered before #{
      @delivery_deadline}"
  end

  def send_text
    twilio_setup
    if @test == true
      test_run
    else
      real_run
    end
  end

  private

  def twilio_setup
    require 'rubygems'
    require 'twilio-ruby'
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def test_run
    puts "Testing. No text sent. Message would have been:\n" + @confirmation_body
  end

  def real_run
    message = @client.messages
    .create(
      :body => @confirmation_body,
      :from => '+12677107250',
      :to => '+447462326497'
    )
    puts message.sid
  end

end

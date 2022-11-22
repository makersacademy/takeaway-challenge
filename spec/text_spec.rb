class TextConfirmation
  def initialize(requester)
    @my_mobile = ENV['MY_MOBILE']
    my_auth_token = ENV['TWILIO_TOKEN']
    account_sid = "ACb008b1d4a2bc236d7b06178ccc9a2042"
    auth_token = "#{my_auth_token}"
    @requester = requester
  end

  def send_text
    time = Time.now + 3600
    @requester.messages.create(
    from: "+16614855243",
    to: "+#{@my_mobile}",
    body: "Thank you! Your order was placed and will be delivered before 1230"
    )
  end
end

RSpec.describe TextConfirmation do

  it "sends a confirmation text to a number" do
    @my_mobile = ENV['MY_MOBILE']
    fake_message = double :fake_message
    fake_requester = double :requester, messages: fake_message
    expect(fake_message).to receive(:create).with(
      from: "+16614855243",
      to: "+#{@my_mobile}",
      body: "Thank you! Your order was placed and will be delivered before 1230"
      ).and_return("Thank you! Your order was placed and will be delivered before 1230")
    text = TextConfirmation.new(fake_requester)
    
    expect(text.send_text).to eq "Thank you! Your order was placed and will be delivered before 1230"
  end

end
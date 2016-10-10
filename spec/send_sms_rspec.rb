require 'send_sms'

#allow(subject).to receive(:client).and_return(Twilio::REST::Client.new 'ABC', 'd0751fad2')



describe "Sensd sms" do
  before do
    @client = Twilio::REST::Client.new 'ABC', 'd0751fad2'
    @output = StringIO.new("Sent message to #{value}")
  end
  it "send a message confirmation" do
    expect(@output.string).to  eq("Sent message to #{value}")
  end
end

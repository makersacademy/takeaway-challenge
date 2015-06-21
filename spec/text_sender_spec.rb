require 'text_sender'
# require 'twilio_ruby'

describe TextSender do
  time = Time.new
  let(:twilio) { double :twilio, send_message: "Thank you -  your order has been placed and will be delivered by #{(time.hour + 1)}:#{time.min}" }


  it 'should be able to send a text verifying correct order has been placed' do
    time = Time.new
    expect(subject.order_confirmation twilio).to eq("Thank you -  your order has been placed and will be delivered by #{(time.hour + 1)}:#{time.min}")
  end

	# let (:client) do
	# 	Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
	# end
	#
	# let (:lucy) {double :person,     number '447878265716'}
	# let (:lucy2)     {double :person,     number '447878265716', name: "Lucy"}
	#
	# it 'sends a message' do
	#   TextSender.call(message: "Hello", from: lucy, to: lucy2, via: client)

end

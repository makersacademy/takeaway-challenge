require 'send_text'

describe SendText do
  describe '#send_confirmation' do
    before do
      @client = double(:client)
      @texter = SendText.new(@client)
      allow(@client).to receive(:messages).and_return(@client)
      allow(@client).to receive(:create).with(any_args).and_return("Thank you! Your order was placed and will be delivered by 19:15")
    end

    it 'sends a order confirmation text message with the delivery time' do
      expect(@texter.send_confirmation('19:15')).to eq "Thank you! Your order was placed and will be delivered by 19:15"
    end

    it 'provides a message to standard output when TWILIO not set up correctly' do
      texter_alt = SendText.new(Twilio::REST::Client.new("", ENV['TWILIO_AUTH_TOKN']))
      expect(texter_alt.send_confirmation('19:15')).to eq "Thank you! Your order was placed and will be delivered by 19:15"
    end
  end
end

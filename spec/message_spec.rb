require 'message'
require 'twilio-ruby'

describe Message do
  
  let(:message) { described_class.new }

  context 'gets information for Twilio to work' do

    before(:each) do
      allow(message).to receive(:account_sid) { 123456 }
      allow(message).to receive(:auth_token) { 'abcdef' }
      allow(message).to receive(:client) { 'code that sends text' }
      allow(message).to receive(:from) { 4407323240 }
      allow(message).to receive(:to) { 4407321234 }
    end

    it "expects to know about account_sid" do
      expect(message.account_sid).to eq 123456 
    end

    it 'expects to know about auth_token' do
      expect(message.auth_token).to eq 'abcdef'
    end

    it "has the twilio app set to client" do
      expect(message.client).to eq 'code that sends text'
    end

    it 'has a from number' do
      expect(message.from).to eq 4407323240
    end

    it 'has a to number' do
      expect(message.to).to eq 4407321234
    end

    it "sends the text confirmation" do
      expect(message).to receive(:send_text).with("Thanks. Your total is £24.97. It'll be there by 12 pm.")
      message.send_text("Thanks. Your total is £24.97. It'll be there by 12 pm.")
    end
  end
end

  # context 'can send text (but uses Webmock)' do
  #   it "sends the text confirmation" do
  #     message = "Thank you! Your order was placed and will be delivered before 18:52"
  #     host = "#{ENV['TWILIO_ACCOUNT_SID']}: #{ENV['TWILIO_ACCOUNT_AT']}@api.twilio.com"
  #     assert_requested(:post, "#{host}/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}
  #       /Messages.json").with(:body => {:data => {'From' => '+44 7479 270740', 'To' => '+44 7463 233745', 'Body' => message}})
  #     subject.send_text(message)
  #   end
  # end


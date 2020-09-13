require 'twilio_service'

describe TwilioService do

  subject(:twilio) { TwilioService.new(account_sid, auth_token, from_phone, client_dbl) }
  let(:account_sid) { double('account_sid') }
  let(:auth_token) { double('auth_token') }
  let(:from_phone) { '+447403304971' }
  let(:client_dbl) { double('twilio_client', messages: true, create: 'message created')}

  it 'can be initialised with just account_sid, auth_token and from_phone as arguments' do
    expect(TwilioService).to respond_to(:new).with(3).arguments
  end

  it 'creates a Twilio client if not provided as an argument' do
    twilio = TwilioService.new(account_sid, auth_token, from_phone)

    expect(twilio.client).to be_a_kind_of(Twilio::REST::Client)
  end

  it 'stores the client object provided if passed in the argument' do
    twilio = TwilioService.new(account_sid, auth_token, from_phone, client_dbl)

    expect(twilio.client).to eq(client_dbl)
  end

  describe '#send_sms(to_phone, msg)' do
    it 'takes the recipient phone and message as arguments' do
      expect(twilio).to respond_to(:send_sms).with(2).arguments
    end

    it 'sends a message to the client to create a message' do
      expected_args = { body: 'Test message', from: from_phone, to: '+447930013030' }

      expect(client_dbl.messages).to receive(:create).once.with(expected_args)
      twilio.send_sms('+447930013030', 'Test message')
    end
  end
end
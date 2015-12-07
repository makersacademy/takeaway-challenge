require 'send_sms.rb'

describe Twillio do
  subject(:twil)  { described_class.new }
  let(:order) { double(:order)}

  # before do
  #   allow(twil).to receive(:confirmation_text)
  # end

  it 'allow customers to place order by passing current dishes/quantities and expected total' do
    expect(subject).to respond_to(:confirmation_text).with(1).argument
  end


  it 'sends a text message to confirm a succesful order' do
    expect(twil.confirmation_text("Hello!", ENV["TWILIO_TEST_SID"], ENV["TWILIO_TEST_AUTH_TOKEN"], ENV["TWILIO_MAGIC_NUMBER"])).to eq twil.message.sid
  end


end

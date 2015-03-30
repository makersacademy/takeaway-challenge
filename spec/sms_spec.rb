require 'sms'

describe Sms do
  let(:dummy_class) { Class.new { include Sms } }
  it 'can send a text message to a given number and message' do
    allow(dummy_class).to receive(:send) { 'sent' }
    expect(dummy_class.send('+447777000000', 'A message')).to eq 'sent'
  end

end

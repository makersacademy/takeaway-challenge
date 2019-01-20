require 'text'

RSpec.describe Text do
  let(:text) { Text.new({ name: 'takeaway', number: '+4412345678', sid: 'abc', token: 'abc'}) }
  # allow(:text).to recieve(:send_confirmation).and_return({:error_code => 0})

  subject { text }

  it 'accepts a hash as arguments' do
    is_expected.to respond_to(:send_confirmation).with(1).argument
  end

  xit 'returns error code 0 on sending a text' do
    twilio = instance_double('Twilio::REST::Client')
    twilio.stub_chain(:messages, :create).and_return( {error_code: 0} )
    allow(text).to receive(:send_confirmation).with('+4412345678').and_return(twilio)
    expect(text.send_confirmation('+4412345678')).to have_attributes(:error_code => 0)
  end

end

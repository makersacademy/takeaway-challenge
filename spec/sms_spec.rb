require 'sms'

describe Sms do

  it 'generates a text' do
    expect(Sms::Client.messages).to receive(:create)
    Sms.text('a number')
  end

end

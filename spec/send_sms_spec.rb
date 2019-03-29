require 'send_sms'

describe Text do
  it 'sends a text' do
    expect(subject).to respond_to(:send_text)
  end
end

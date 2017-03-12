require 'send_sms'

describe SMS do
  it '#SMS' do
    expect(subject).to respond_to(:send)
  end
end

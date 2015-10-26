require 'smsmessager'

describe SmsMessager do

  subject(:SmsMessager) { described_class }
  it 'responds to the send_text method' do
    expect(SmsMessager).to respond_to(:send_text)
  end

end

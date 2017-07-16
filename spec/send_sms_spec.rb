require 'send_sms'

describe Text do
  let(:text) {described_class.new}

  it 'responds to the send_sms method' do
    expect(text).to respond_to(:send_text)
  end

  before do
    allow(text).to receive(:send_text).and_return("Thank you! Your order was placed and will be delivered before 00:00")
  end
  it 'sends text message' do
    expect(text.send_text).to eq("Thank you! Your order was placed and will be delivered before 00:00")
    text.send_text
  end

end

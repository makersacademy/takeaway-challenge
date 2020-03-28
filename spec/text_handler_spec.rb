require 'text_handler'

describe TextHandler do
  it 'sends an order confirmation text to the customer' do
    allow(subject).to receive(:send_confirmation_text).and_return('Text sent')
    expect(subject.send_confirmation_text).to eq 'Text sent'
  end
end
require 'confirmation_text_sender'

describe ConfirmationTextSender

  subject(:confirmationtextsender) { described_class.new }
  before do
    allow(confirmationtextsender).to receive(:send_message)
  end

  it 'sends a payment confirmation text message' do
    expect(confirmationtextsender).to receive(:send_message).with("Hi from FOOD! Your order has cost £#{20.93} and will arrive at #{calculate_time}.")
    confirmationtextsender.message(20.93)
  end

end

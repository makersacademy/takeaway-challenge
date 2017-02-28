require 'text_confirmation'

describe TextConfirmation do

  subject(:text_confirmation) { described_class.new }
  let (:order) { double :order }

  it 'should create and send a text message' do
    expect(text_confirmation).to receive(:order_finished).with(order)
    text_confirmation.order_finished(order)
  end

end

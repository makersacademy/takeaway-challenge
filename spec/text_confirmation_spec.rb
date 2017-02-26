require 'text_confirmation'

describe TextConfirmation do

  subject(:text_confirmation) { described_class.new }
  let (:order) { double :order }

  it {is_expected.to respond_to(:order_finished).with(1).argument }

  it 'confirms the order when requested by the customer' do
    expect(text_confirmation.order_finished(order)).to eq "Your #{order} will arrive at " + subject.est_delivery_time
  end

  it 'confirms the time of the delivery' do
    time = Time.new
    message = "#{time.hour + 1}.#{time.min}"
    expect(text_confirmation.est_delivery_time).to eq message
  end

end

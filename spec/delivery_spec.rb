require 'delivery'
require 'timecop'

describe Delivery do
  subject { Delivery.new }

  before do
    Timecop.freeze(Time.parse("16:45"))
  end

  it 'calculates delivery time' do
    expect(subject.calculate_delivery_time).to eq("17:45")
  end

  it 'tells the user when the order has been placed' do
    message = "Order placed! It will be delivered by 17:45\n"
    expect { subject.user_delivery_notification }.to output(message).to_stdout
  end

end

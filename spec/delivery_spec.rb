require 'rspec'
require 'delivery'

describe Delivery do
  it 'states order delivery time' do
    time = (Time.now + 1*60*60).strftime("%H:%M")
    expect(subject.delivery_time).to eq "You will recieve your order at or before #{time}."
  end
end
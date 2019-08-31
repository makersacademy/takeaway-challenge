require './lib/order.rb'

describe Order do
  #order = Order.new("burger", 3)
  it 'stores the dish and quantity ordered' do
    expect(subject.add("burger", 3)).to eq([["burger", 3]])
  end
  it 'can add dishes to the current order' do
    subject.add("burger", 3)
    expect(subject.add("chips", 2)).to eq([["burger", 3], ["chips", 2]])
  end
end

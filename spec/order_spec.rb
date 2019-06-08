require 'order'

describe Order do
  
  it 'should add dishes when add_items is run' do
    dish1 = double("dish")
    sms = double("sms")
    allow(sms).to receive(:send_sms) { true }
    order = Order.new(sms)
    order.add_dishes(dish1, 3)
    expect(order.dishes).to eql([{ :dish => dish1, :qty => 3 }])
  end

  it 'should add dishes when add_items is run' do
    dish1 = double("dish")
    sms = double("sms")
    allow(sms).to receive(:send_sms) { true }
    order = Order.new(sms)
    order.add_dishes(dish1, 3)
    expect(order.dishes).to eql([{ :dish => dish1, :qty => 3 }])
  end

  it 'should raise an error if the order total is different to a given price' do
    dish1 = double("dish1")
    dish2 = double("dish2")
    allow(dish1).to receive(:price) { 1.99 }
    allow(dish2).to receive(:price) { 3.50 }
    sms = double("sms")
    allow(sms).to receive(:send_sms) { true }
    order = Order.new(sms)
    order.add_dishes(dish1, 2)
    order.add_dishes(dish2, 3)
    expect { order.check_total(1000.00) }.to raise_error("Total given is incorrect. It should be £14.48")
  end

  it 'should return true if the order total is the same as a given price' do
    dish1 = double("dish1")
    dish2 = double("dish2")
    allow(dish1).to receive(:price) { 1.99 }
    allow(dish2).to receive(:price) { 3.50 }
    sms = double("sms")
    allow(sms).to receive(:send_sms) { true }
    order = Order.new(sms)
    order.add_dishes(dish1, 2)
    order.add_dishes(dish2, 3)
    expect(order.check_total(14.48)).to eql(true)
  end

  it 'should return an SMS message with a time one hour from now when order is placed' do
    time = double("time")
    sms = double("sms")
    order = Order.new(time, sms)
    allow(time).to receive(:hour) { 9 }
    allow(time).to receive(:min) { 2 }
    allow(sms).to receive(:send_sms) { true }
    expect(order.place_order).to eql(true)
  end

end

require 'neworder'
require 'menu'
require 'timestamp'
require 'sms'

describe NewOrder do
  let(:neworder) { described_class.new }

  before do
    allow_any_instance_of(SMS).to receive(:send)
  end

  it 'adds dishes and quantities to an order' do
    neworder.add_dish(:pizza, 2)
    neworder.add_dish(:fried_chicken, 4)
    expect(neworder.order.count({pizza: 10.00})).to eq 2
    expect(neworder.order.count({fried_chicken: 8.50})).to eq 4
  end

  it 'adds up the order\'s total cost' do
    neworder.add_dish(:fried_chicken, 2)
    expect(neworder.total).to eq 17
  end

  it 'takes total and raises an error if incorrect' do
    neworder.add_dish(:pizza, 2)
    expect{neworder.place_order(19.00)}.to raise_error 'Incorrect total given'
  end

  # not 100% if this is really testing the .send method is called, but it passes...
  it 'sends confirmation text if the given total is correct' do
    expect(neworder.sms).to receive(:send)
    neworder.add_dish(:pizza, 2)
    neworder.place_order(20.00)
  end
end

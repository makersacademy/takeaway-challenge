require_relative '../lib/order.rb'

describe Order do
  subject { described_class.new }

  it 'creates new order of class Order' do
    expect(subject).to be_a(Order)
  end

  it 'creates new order with menu' do
    order = Order.new
    expect(order.current_order).to include {}
  end

  it 'will place an order' do
    expect(subject).to respond_to(:place_order)
  end
  
  it 'adds menu items to the current order' do
    subject.place_order("prawn_crackers", 1)
    expect(subject.current_order).to include { prawn crackers: 1 }
  end
  
  it 'can check what is in the current order' do
    subject.place_order("prawn_crackers", 1)
    subject.place_order("chicken_satay", 1)
    expect(subject.check_order).to eq({"prawn_crackers"=>1, "chicken_satay"=>1})
  end
  

end

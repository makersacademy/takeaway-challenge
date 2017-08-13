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
  
  it 'calculates total to be paid' do
    subject.place_order("prawn_crackers", 1)
    subject.place_order("chicken_satay", 1)
    subject.total
    expect(subject.final_total).to eq(5.00)
  end
  
  # it 'raises error when item added is not on the menu' do
  #   expect{subject.place_order("red_curry", 1)}. to raise_error("That item is not on the menu, please choose again")
  # end
  

end

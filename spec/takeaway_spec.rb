require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish) {double(:dish)}
  let(:burger) {"Burger: £8"}
  let(:menu) {double(:menu)}

  it 'initializes with a new instance of Menu class' do
    takeaway.menu << dish
    expect(takeaway.menu).to include dish
  end

  it 'shows the menu as a string' do
    expect(takeaway.show_menu).to include burger
  end

  it 'creates a new, empty order' do
    expect(takeaway.order).to be_a(Order)
  end

  it 'adds item to new order' do
    takeaway.add_to_order("Burger")
    expect(takeaway.order.items[0]).to be_a(Dish)
  end

  it 'updates total in order when adding dishes' do
    3.times { takeaway.add_to_order("Burger") }
    2.times { takeaway.add_to_order("Salad") }
    expect(takeaway.order.total).to eq 36
  end 

  it 'adds total sum to the order' do
    takeaway.sum_total(takeaway.menu[1])
    takeaway.sum_total(takeaway.menu[2])
    expect(takeaway.order.total).to eq 14
  end
end

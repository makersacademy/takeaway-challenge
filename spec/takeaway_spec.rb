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
    expect(takeaway.new_order).to be_a(Order)
  end

  it 'adds item to new order' do
    takeaway.add_to_order("Burger")
    expect(takeaway.order.items[0]).to be_a(Dish)
  end

end

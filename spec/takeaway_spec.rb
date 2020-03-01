require 'takeaway'
require 'order'
require 'menu'

describe Takeaway do

  let(:items) { { chicken: 5, cabbage: 5 } }
  let(:menu) { double(:menu, show_menu: "Chicken: £5\nCabbage: £5\n") }
  let(:order) { double(:order, total: 10.00) }
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:place_order) { double :place_order }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it 'shows the menu with the dishes and prices' do 
    expect(subject.print_menu).to eq("Chicken: £5\nCabbage: £5\n")
  end

  it 'shows the the correct order is correct amount and prints a message' do
    expect(subject.complete_order(10)).to eq("The order is correct")
  end

  before do
    allow(place_order).to receive(:dish).with(:chicken)
    allow(place_order).to receive(:quantity).with(:chicken).and_return(2)
  end

  it 'shows the the order is incorrect amount and prints a message' do
    expect(subject.complete_order(15)).to eq("The order is incorrect")
  end

  it 'knows the order total' do 
    expect(subject.order.total).to eq(10.00)
  end

end

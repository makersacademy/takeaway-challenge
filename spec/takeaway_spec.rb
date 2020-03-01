require 'takeaway'
require 'order'
require 'menu'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let (:menu) { double(:menu, show_menu: "Chicken: £3.50\nCabbage: £4.50\n") }
  
  let (:show_menu) {double :show_menu}
  let (:order) { instance_double("Order", total: 8.00) }
  let (:place_order) { double :place_order }
  let (:dish) {double :dish }
  let (:quantity) {double :quantity }

  let(:items) { {chicken: 1, cabbage: 1} }

   # before do 
  #   allow(order).to receive(:adds_item)
  #   allow(menu).to receive(:show_menu)
  #   allow(place_order).to receive(:dish).with(:chicken)
  #   allow(place_order).to receive(:quantity).with(:chicken).and_return(1)
  #   allow(place_order).to receive(:dish).with(:cabbage)
  #   allow(place_order).to receive(:quantity).with(:cabbage).and_return(1)
  # end

  it "initializes with an empty customer order" do
    expect(takeaway).to have_attributes( order: {})
  end 

  it 'shows the menu with the dishes and prices' do 
    expect(takeaway.print_menu).to eq("Chicken: £3.50\nCabbage: £4.50\n")
  end

  it 'can order some number of several available dishes' do 
    expect(order).to receive(:adds_item).twice
    takeaway.place_order(dish, quantity)
  end

  it 'knows the order total' do 
    total = takeaway.place_order(dish, quantity)
    expect(total).to eq(8.00)
  end

end

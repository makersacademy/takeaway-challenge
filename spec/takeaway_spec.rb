require 'takeaway'


describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order)}
  let(:menu) { double(:menu, show_menu: print_menu) }
  let(:print_menu) { "Spring rolls £1.50" }
  let(:order) { double(:order) }
  let(:dishes) {{chicken: 2, fish:1, beef: 4 }}

  # let(:menu) { double :menu, dishes: {"seaweed" => 1.20} }
  # let(:place_order) { double :place_order }
  # let(:selection) { double :selection }
  # let(:quantity) { double :quantity }

  it " shows the list of dishes with prices" do
  #  allow(takeaway).to receive(:show_menu).and_return({"seaweed" => 1.20})
    expect(takeaway.list_dishes).to eq(print_menu)
  end

  it "can order any number of available dishes" do
    expect(order).to receive(:add).at_least(:once)
    takeaway.place_order(dishes)
  end
  # it "order takes two arguments" do
  #   expect(takeaway).to respond_to(:place_order).with(2).arguments
  # end
  #
  # it "compiles an order" do
  #   expect(takeaway).to respond_to(:order)
  # end

  # it 'places and order' do
  #   takeaway.show_menu
  #   takeaway.place_order("chicken balls", 4)
  #   expect(takeaway.order).not_to eq []
  # end

#   it "prints a list of items in the basket" do
#     expect(takeaway).to respond_to(:basket)
#   end
#
end

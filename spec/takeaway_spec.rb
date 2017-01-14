require 'takeaway'


describe Takeaway do

  subject(:takeaway) { described_class.new}
  let(:menu) { double :menu, dishes: {"seaweed" => 1.20} }
  let(:place_order) { double :place_order }
  let(:selection) { double :selection }
  let(:quantity) { double :quantity }

  it " shows the list of dishes with prices" do
    allow(takeaway).to receive(:show_menu).and_return({"seaweed" => 1.20})
    expect(takeaway.show_menu).to eq(menu.dishes)
  end

  it "order takes two arguments" do
    expect(takeaway).to respond_to(:place_order).with(2).arguments
  end

  it "compiles an order" do
    expect(takeaway).to respond_to(:order)
  end

  it 'places and order' do
    takeaway.show_menu
    takeaway.place_order("chicken balls", 4)
    expect(takeaway.order).not_to eq []
  end

  it "prints a list of items in the basket" do
    expect(takeaway).to respond_to(:basket)
  end

end

require 'takeaway'


describe Takeaway do

  subject(:takeaway) { described_class.new}
  let(:menu) { double :menu, starter: {"seaweed" => 1.20} }

  it " shows the list of dishes with prices" do
    allow(takeaway).to receive(:show_menu).and_return({"seaweed" => 1.20})
    expect(takeaway.show_menu).to eq(menu.starter)
  end

  it "order takes two arguments" do
    expect(takeaway).to respond_to(:place_order).with(2).arguments
  end

  it "compiles an order" do
    expect(takeaway).to respond_to(:order)
  end

  
end

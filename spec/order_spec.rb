require "Order"

describe Order do
  subject(:order) {described_class.new(menu)}
  let(:menu) {double(:menu, check_price: 1.00, calculate_subtotal: [["Taco", 5, 5.00]])}

 before do
   allow(STDOUT).to receive(:puts)
 end

context 'Initialize' do
  it "Has an empty cart to begin with" do
    expect(order.instance_variable_get(:@cart)).to be_empty
  end
  it "Shows a menu to place the order" do
    expect(order.instance_variable_get(:@menu)).to eq menu
  end
end

describe '#order' do
  it "should allow customer to select a dish to add to the cart" do
    order.add_to_order("Taco")
    expect(order.instance_variable_get(:@cart)).to eq({"Taco"=>1.00})
end

  it "adds the quantity of item selected to the order" do
    order.add_to_order("Taco", 2)
    expect(order.instance_variable_get(:@cart)).to eq({"Taco" => 2})
  end

  it "should list the same items together" do
    order.add_to_order("Taco")
    order.add_to_order("Taco", 3)
    expect(order.instance_variable_get(:@cart)).to eq ({"Taco"=> 4})
  end

  it "makes sure the items are on the menu" do
    expect(menu).to receive(:check_price).with("Taco")
    order.add_to_order("Taco")
  end

  it "adds the item's price to subtotal" do
    order.add_to_order("Taco")
    expect(order.instance_variable_get(:@total)).to eq 1.00
  end
end

end

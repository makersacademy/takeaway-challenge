require "Order"

describe Order do
  subject(:order) {described_class.new(menu)}
  let(:menu) {double(:menu, check_price: 1.00, calculate_subtotal: [["Taco", 5, 5.00]])}

 before do
   allow(STDOUT).to receive(:puts)
 end

context 'Initialize' do
  it "Begins with an empty cart" do
    expect(order.instance_variable_get(:@cart)).to be_empty
  end
  it "Shows a menu to place the order" do
    expect(order.instance_variable_get(:@menu)).to eq menu
  end
end

describe '#order' do
  it "Allows customer to select a dish and add it to their cart" do
    order.add_to_order("Taco")
    expect(order.instance_variable_get(:@cart)).to eq({"Taco"=>1.00})
end

  it "Adds the quantity of a selected item to the cart" do
    order.add_to_order("Taco", 2)
    expect(order.instance_variable_get(:@cart)).to eq({"Taco" => 2})
  end

  it "Makes sure to list the same items together" do
    order.add_to_order("Taco")
    order.add_to_order("Taco", 3)
    expect(order.instance_variable_get(:@cart)).to eq ({"Taco"=> 4})
  end

  it "Checks that items are on the menu" do
    expect(menu).to receive(:check_price).with("Taco")
    order.add_to_order("Taco")
  end

  it "Adds an item's price to the subtotal" do
    order.add_to_order("Taco")
    expect(order.instance_variable_get(:@total)).to eq 1.00
  end
end

end

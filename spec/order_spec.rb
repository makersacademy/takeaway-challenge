require 'order'

describe Order do
  it "should be able to create and isntatnce of Menu" do
    expect(Order).to respond_to(:new)
  end

  describe "#add_item" do
    it 'should respond to add_item' do
      expect(Order.new).to respond_to(:add_items)
    end

    it 'should add an item' do
      order = Order.new
      order.add_items(1)
      expect(order.order).to eq([{"Margherita Pizza" => 8}])
    end
  end

end

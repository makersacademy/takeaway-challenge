require 'order'

describe Order do

  menu_items = {
    "Chicken burger" => 10,
    "Vegan Soup" => 5,
    "Chang Beer" => 3
  }

  let(:menu) { double(:menu) }
  subject(:order) { described_class.new(menu) }
  let(:item) { ( { "Chicken burger" => 10 } ) }
  let(:item2) { ( { "Vegan Soup" => 5  } ) }

  before(:each) do
    allow(menu).to receive(:items).and_return(menu_items)
  end

  describe "#initialize" do
    it "returns empty array" do
      expect(order.items_ordered).to eq []
    end

    it "returns correct menu length" do
      expect(order.menu.items.length).to eq 3
    end

    # another test for the menu instance variable
  end

  describe "#add_item" do
  
    it "adds item to items_ordered" do
      expect{ order.add_item(item) }.to change {order.items_ordered.length}.by(1)
    end

    it "adds correct price to the order" do
      order.add_item(item)
      expect(order.items_ordered.first["Chicken burger"]).to eq (10)
    end
  end

  describe "#order_value" do
    it "correctly calculates order value" do
      order.add_item(item)
      order.add_item(item2)
      expect(order.order_value).to eq 15
    end
  end

  describe "#place_order" do
    # it "returns correct time" do
    #   expect(order.place_order).to eq Time.new
    # end
  end
end
require 'order'

describe Order do

  subject(:order) { described_class.new }

  starters = {:soup => 1.50,
  :salad => 1.00,
  :scallops => 2.50}
  mains = {:steak => 7.50,
  :lasagne => 5.50,
  :lobster => 8.00 }
  desserts = {:tiramisu => 2.50,
  :cheesecake => 2.00,
  :profiteroles => 1.50}
  sides = {:bread => 0.50,
  :chips => 1.50,
  :kimchi => 2.00}

  it "has an order class" do
    expect(order).to be_a Order
  end

  context "using Menu module" do
    it "can display starters in a hash" do
      expect(order.view_starters).to eq starters
    end

    it "can display mains in a hash" do
      expect(order.view_mains).to eq mains
    end

    it "can display desserts in a hash" do
      expect(order.view_desserts).to eq desserts
    end

    it "can display sides in a hash" do
      expect(order.view_sides).to eq sides
    end

    it "can display a full menu in an array" do
      expect(order.view_menu).to eq [starters, mains, desserts, sides]
    end
  end

  context "when placing orders" do
    it "has an empty hash for a new order" do
      expect(order.current_order).to eq ({})
    end

    it "can accept an item for an order, specifying quantity" do
      expect{order.add_to_order(:soup, 3, 4.50)}.to change{order.current_order}.to ({:soup => 3})
    end

    it "won't accept items not on the menu" do
      expect{order.add_to_order(:Tacos, 1, 1)}.to raise_error 'Item not on menu'
    end

    it "verifies the price entered is correct" do
      expect{order.add_to_order(:soup, 3, 5)}.to raise_error 'Incorrect price, order rejected'
    end
  end

end

require 'order'

describe Order do

  subject(:order) { described_class.new }

  let(:confirmation) { double :confirmation }

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
  full_menu = starters.merge(mains).merge(desserts).merge(sides)

  it "has an order class" do
    expect(order).to be_a Order
  end

  context "using Menu module" do
    it "can display starters in a hash" do
      expect(order.starters).to eq starters
    end

    it "can display mains in a hash" do
      expect(order.mains).to eq mains
    end

    it "can display desserts in a hash" do
      expect(order.desserts).to eq desserts
    end

    it "can display sides in a hash" do
      expect(order.sides).to eq sides
    end

    it "can display a full menu in a hash" do
      expect(order.view_menu).to eq full_menu
    end
  end

  context "when placing orders" do
    it "has an empty hash for a new order" do
      expect(order.current_order).to eq ({})
    end

    it "can accept an item for an order (starter), specifying quantity and price" do
      expect{order.add_to_order(:soup, 3, 4.50)}.to change{order.current_order}.to ({:soup => 3})
    end

    it "can accept an item for an order (main), specifying quantity and price" do
      expect{order.add_to_order(:lobster, 5, 40)}.to change{order.current_order}.to ({:lobster => 5})
    end

    it "won't accept items not on the menu" do
      expect{order.add_to_order(:tacos, 1, 1)}.to raise_error 'Item not on menu'
    end

    it "verifies the price entered is correct" do
      expect{order.add_to_order(:soup, 3, 5)}.to raise_error 'Incorrect price, order rejected'
    end
  end

  context 'when finalizing orders' do
    before do
      order.add_to_order(:soup, 3, 4.50)
      order.add_to_order(:lobster, 2, 16)
    end

    it "can view items in an order and the quantity of each" do
      expect(order.current_order).to eq ({:soup=>3, :lobster=>2})
    end

    it "can view the total cost of the order" do
      expect(order.total).to eq 20.5
    end
  end

  context "using Text module" do
    it "can send a text to confirm order" do
      VCR.use_cassette('twilio') do
        order.finalize_order
      end
    end
  end

end

require 'order'
require 'menu_module'

describe Order do

  subject(:order) { described_class.new }

  let(:confirmation) { double :confirmation }

  full_menu = Menu::STARTERS.merge(Menu::MAINS).merge(Menu::DESSERTS).merge(Menu::SIDES)

  it "has an order class" do
    expect(order).to be_a Order
  end

  context "using Menu module" do
    it "can display starters in a hash" do
      expect(order.starters).to eq Menu::STARTERS
    end

    it "can display mains in a hash" do
      expect(order.mains).to eq Menu::MAINS
    end

    it "can display desserts in a hash" do
      expect(order.desserts).to eq Menu::DESSERTS
    end

    it "can display sides in a hash" do
      expect(order.sides).to eq Menu::SIDES
    end

    it "can display a full menu in a hash" do
      expect(order.view_menu).to eq full_menu
    end
  end

  context "when placing orders" do
    it "has an empty hash for a new order" do
      expect(order.current_order).to eq []
    end

    it "can add an item to an order (starter), specifying quantity and price" do
      order.add_to_order(:soup, 3, 4.50)
      expect(order.current_order).to eq [["3 x soup = £4.5"]]
    end

    it "can add an item to an order (main), specifying quantity and price" do
      order.add_to_order(:lobster, 5, 40)
      expect(order.current_order).to eq [["5 x lobster = £40"]]
    end

    it "won't accept items not on the menu" do
      expect{order.add_to_order(:tacos, 1, 1)}.to raise_error 'Item not on menu'
    end

    it "verifies the price entered is correct" do
      expect{order.add_to_order(:soup, 3, 5)}.to raise_error Order::PRICE_ERROR
    end
  end

  context 'when finalizing orders' do
    before do
      order.add_to_order(:soup, 3, 4.50)
      order.add_to_order(:lobster, 2, 16)
    end

    it "can view items in an order and the quantity of each" do
      expect(order.current_order).to eq [["3 x soup = £4.5"], ["2 x lobster = £16"]]
    end

    it "can view the total cost of the order" do
      expect(order.total).to eq "£20.5"
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

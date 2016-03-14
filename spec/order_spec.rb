require "order"

describe Order do
  let(:menu) { double :menu, list: {menu_item => menu_item_price}, price: menu_item_price }
  let(:sms_sender) { double :sms_sender }
  subject(:order) { described_class.new(menu, sms_sender) }
  let(:menu_item) { double :cheese_sandwich }
  let(:menu_item_price) { 3 }
  let(:item_quantity) { rand(1..5) }

  describe "#initialize" do
    it "has an empty basket" do
      expect(order.basket).to be_empty
    end
  end

  describe "#view_menu" do
    it "displays menu" do
      expect(menu).to receive(:list)
      order.view_menu
    end
  end

  describe "#add_to_basket" do

    before do
      order.add_to_basket(menu_item, item_quantity)
    end

    it "should add menu item to basket" do
      expect(order.basket).to include(menu_item => item_quantity)
    end
    it "raises error when trying to select item that is not on the menu" do
      message = Order::NOT_ON_MENU_ERROR
      expect { order.add_to_basket("Falafel") }.to raise_error message
    end
  end

  describe "#checkout" do

    before do
      order.add_to_basket(menu_item)
    end

    it "raises error if estimated cost is incorrect" do
      estimated_total = rand(0..menu_item_price-1)
      message = Order::INCORRECT_ESTIMATED_TOTAL_ERROR
      expect { order.checkout(estimated_total) }.to raise_error message
    end
    it "raises error if basket is empty" do
      order = described_class.new(menu)
      message = Order::EMPTY_BASKET_ERROR
      expect { order.checkout(0) }.to raise_error message
    end
    it "sends an SMS confirmation" do
      expect(sms_sender).to receive(:send_sms)
      order.checkout(menu_item_price)
    end
  end
end

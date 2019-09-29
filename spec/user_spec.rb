require 'user'

describe User do
  let(:menu_dub) { double :a_menu }
  let(:order_dub) { double :an_order }
  subject(:user) { described_class.new(menu_dub, order_dub) }
  let(:item) { double :item }
  let(:quantity) { double :quantity }

  describe "#view_menu" do

    let(:menu_items) { { :margherita => 7.50, :pepperoni => 10.50,
                   :calzone => 12.50, :diavola => 10.50 } }

    it "shows the menu" do
      allow(menu_dub).to receive(:menu) { menu_items }
      expect(user.view_menu).to eq menu_items
    end
  end

  describe "#select" do
    it "it adds user selection and quanity to order_list" do
      allow(order_dub).to receive(:add_to_basket)
      expect(user.select(item, quantity)).to eq("#{quantity} x #{item} added to order")
    end
  end

  describe "#my_order" do

    let(:order_list) { { item => quantity } }

    it "shows users current order_list" do
      allow(order_dub).to receive(:order_list) { order_list }
      expect(user.view_order).to eq order_list
    end
  end

  describe "#total" do
    it "returns total price in string format" do
      allow(order_dub).to receive(:order_total) {7.5}
      expect(user.total).to eq "£7.5"
    end
  end

  describe "#confirm_order" do
    it "lets user confirm order having viewed order list" do
      user.confirm
      expect(user.order_confirmed).to be true
    end
  end
end

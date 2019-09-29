require 'user'

describe User do
  let(:menu_dub) { double :a_menu }
  let(:order_list_dub) { double :an_order_list }
  subject(:user) { described_class.new(menu_dub, order_list_dub) }
  let(:item) { double :item }
  let(:quantity) { double :quantity }

  describe "#view_menu" do

    let(:menu_items) { { :margherita => 7.50, :pepperoni => 10.50,
                   :calzone => 12.50, :diavola => 10.50 } }

    it "shows the menu" do
      allow(menu_dub).to receive(:menu) { menu_items }
      expect(user.view_menu). to eq menu_items
    end
  end

  # describe "#select" do
  #   it "it adds user selection and quanity to order_list" do
  #     user.order(item, quantity)
  #   end
  # end

  describe "#my_order" do

    let(:order_list) { { item => quantity } }

    it "shows users current order_list" do
      allow(order_list_dub).to receive(:order_list) { order_list }
      expect(user.view_order). to eq order_list
    end
  end

  describe "#confirm_order" do
    it "lets user confirm order having viewed order list" do
      user.confirm
      expect(user.order_confirmed).to be true
    end
  end
end

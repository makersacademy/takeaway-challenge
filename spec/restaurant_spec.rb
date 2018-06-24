require "restaurant"
require "menu"

describe Restaurant do
  subject(:restaurant) { described_class.new }
  let(:menu) { double :menu }
  let(:english_menu) { double :english_menu }
  let(:dish) { double :dish }
  let(:order) { double :order }
  let(:basket) { double :basket }

  describe "menu" do
    it { is_expected.to respond_to :display_menu }

    it "should display the menu" do
      allow(menu).to receive(:show_menu).and_return(english_menu)
      expect(restaurant.display_menu(menu)).to eq english_menu
    end
  end

  describe "basket" do
    it "should add dishes to basket" do
      allow(order).to receive(:add).and_return(basket)
      expect(restaurant.add_to_basket(dish)).to eq(restaurant.basket)
    end

    it "should display the basket" do
      expect(restaurant.display_basket).to eq(restaurant.basket)
    end
  end
end

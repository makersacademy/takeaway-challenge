require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:order) { double :order }

  it { expect(restaurant).to respond_to(:menu) }
  it { expect(restaurant).to respond_to(:order) }
  it { expect(restaurant.order).to be_empty }
  it { expect(restaurant.total_amount).to eq 0 }

  describe "#add" do
    it "adds a dish to the order" do
      restaurant.add("Ruby's Salad", quantity=1)
      expect(restaurant.order).to have_key("Ruby's Salad")
      expect(restaurant.order).to have_value(quantity)
    end
  end

  describe "#show_menu" do
    it "shows the menu" do
      expect(restaurant.show_menu).to eq Restaurant::MENU
    end
  end

  describe "#basket" do
    it "shows the total order" do

    end
  end

end

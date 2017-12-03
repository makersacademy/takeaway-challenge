require "restaurant"

describe Restaurant do

  subject(:restaurant) { described_class.new(menu) }
  let(:menu)           { double :menu, print: example_menu, menu_items: { "Test-dish" => 10.0 } }
  let(:example_menu)   { "Test-dish £10.00" }
  let(:text)           { double :text }

  describe "#print_menu" do
    it "prints the menu" do
      expect(restaurant.print_menu).to eq example_menu
    end
  end

  before do
    restaurant.place_order
  end
  describe "#place_order" do
    it "generates a new order" do
      expect(restaurant.order).to be_a(Order)
    end
  end

  describe "#confirm_order" do
    it "confirms order by creating an SMS" do
      expect(text).to receive(:send_sms).and_return("Order successful. Estimated delivery time 19:00")
      restaurant.confirm_order(text)
    end
  end

end

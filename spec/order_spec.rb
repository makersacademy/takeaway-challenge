require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:order2) { double:order }
  let(:menu) { double:menu, dishes: { Margherita: 7.95, Tropicana: 10.80 }, dish_included?: true }
  let(:printed_menu) { ["Margherita £7.95", "Tropicana £10.80"] }
  let(:message) { double:message }
  let(:dish) { :Margherita }
  let(:quantity) { 3 }
  let(:basket) { { Margherita: 3 } }
  let(:total) { 23.85 }
  let(:amount) { 25 }

  context "order from menu" do
    it "is able to read the menu" do
      allow(menu).to receive(:print_menu).and_return(:printed_menu)
      expect(order.read_menu).to eq :printed_menu
    end

    it "raises an error if the dish is not included in the menu" do
      allow(menu).to receive(:dish_included?).with("salad").and_return(false)
      expect { order.order_dish("salad", 2) }.to raise_error("Sorry, this dish is not included in the menu")
    end

    it "is able to order dishes and quantity" do
      expect(order.order_dish(dish, quantity)).to eq basket
    end
  end

  context "checkout" do
    before { order.order_dish(dish, quantity) }

    it "returns the total amount" do
      expect(order.total_amount).to eq total
    end

    it "raises an error if the amount for checkout is incorrect" do
      expect { order.checkout(amount) }.to raise_error("Incorrect amount")
    end
  end

  it "send confirmation message" do

  end
end

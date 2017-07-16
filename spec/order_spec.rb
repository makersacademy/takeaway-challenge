require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double:menu, dishes: { Margherita: 7.95, Tropicana: 10.80 }, dish_included?: true }
  let(:printed_menu) { ["Margherita £7.95", "Tropicana £10.80"] }
  let(:dish) { :Margherita }
  let(:quantity) { 3 }
  let(:basket) { {Margherita: 3} }
  let(:dish2) { :Tropicana }
  let(:quantity2) { 2 }
  let(:total) { 45.45 }
  let(:dish3) { :Fiorentina }
  let(:quantity3) { 1 }
  let(:amount) { 45 }

  it "is able to read the menu" do
    allow(menu).to receive(:print_menu).and_return(:printed_menu)
    expect(order.read_menu).to eq :printed_menu
  end

  it "raises an error if the dish is not included in the menu" do
    allow(menu).to receive(:dish_included?).with(dish3).and_return(false)
    expect { order.order_dish(dish3, quantity3) }.to raise_error("Sorry, this dish is not included in the menu")
  end

  it "is able to order dishes and quantity" do
    expect(order.order_dish(dish, quantity)).to eq basket
  end

  context "total ammount" do
    before { order.order_dish(dish, quantity) }
    before { order.order_dish(dish2, quantity2) }

    it "returns the total amount" do
      expect(order.total_amount).to eq total
    end

    it "raises an error if the amount for checkout is incorrect" do
      expect { order.checkout(amount) }.to raise_error("Incorrect amount")
    end
  end
end

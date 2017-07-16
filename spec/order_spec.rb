require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double:menu, :dishes => { Margherita: 7.95, Tropicana: 10.80 } }
  let(:printed_menu) { ["Margherita £7.95", "Tropicana £10.80"] }
  let(:dish) { :Margherita }
  let(:quantity) { 3 }
  let(:dish2) { :Tropicana }
  let(:quantity2) { 2 }
  let(:total) { 45.45 }

  it "is able to read the menu" do
    allow(menu).to receive(:print_menu).and_return(:printed_menu)
    expect(order.read_menu).to eq :printed_menu
  end

  it "is able to order dishes and quantity" do
    expect(order.order_dish(dish, quantity)).to eq quantity
  end

  it "returns the total amount" do
    order.order_dish(dish, quantity)
    order.order_dish(dish2, quantity2)
    expect(order.total_amount).to eq total
  end
end

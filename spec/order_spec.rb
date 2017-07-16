require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double:menu}
  let(:printed_menu) { ["Margherita £7.95", "Tropicana £10.80"]}
  let(:dish) { :Margarita }
  let(:quantity) { 3 }

  it "is able to read the menu" do
    allow(menu).to receive(:print_menu).and_return(:printed_menu)
    expect(order.read_menu).to eq :printed_menu
  end

  it "is able to order dishes and quantity" do
    expect(order.order_dish(dish, quantity)).to eq quantity
  end
end

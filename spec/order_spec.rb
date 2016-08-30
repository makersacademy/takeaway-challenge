require 'order'
describe Order do
  let(:menu) { double :menu, price: 1}
  subject(:order) { described_class.new(menu) }

  it 'adds orders to the basket' do
    order.add("Naan", 2)
    order.add("Jalfrezi",5)
    orders = {"Naan"=>2, "Jalfrezi"=>5}
    expect(order.basket).to include orders
  end

  it 'gives total price of the orders' do
    dishes = { "Naan" => 1 }
    order.add("Naan",1)
    order.add("Naan",2)
    total = 3
    expect(order.total).to eq(total)
  end
end

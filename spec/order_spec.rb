require 'order'
describe Order do

  let(:dish) { "chow mein" }
  let(:quantity) { 1 }
  let(:price) { 5.00 }
  subject(:order) { described_class.new }
  let(:message) { "#{quantity} x #{dish}. Price: £#{price}" }
  let(:order_message) { "You ordered: \n" + message + "\nTotal of £#{price}\n"}

  it 'is initialized with an empty basket' do
    expect(order.basket).to eq []
  end

describe '#add' do
  it 'allows customer to select dishes and a quantity' do
    expect(order.add(dish, quantity, price)).to eq "#{quantity} x #{dish}, costing £#{quantity * price} have been added to your order"
  end

  it 'updates the basket' do
    expect { order.add(dish, quantity, price) }.to change{ order.basket.length }.by(1)
  end
end

describe '#remove' do
  it 'allows customer to remove dishes and a quantity' do
    order.add(dish, quantity, price)
    order.remove(dish, quantity, price)
    expect(order.basket.length ).to eq 0
  end

end

  it 'calculates the total of the order in the basket' do
    order.add(dish, quantity, price)
    expect(order.total).to eq price
  end

  it 'prints the completed order' do
      order.add(dish, quantity, price)
      expect{ order.complete_order }.to output(order_message).to_stdout
  end

end



describe Order do

  let(:item) { "Pepperoni pizza" }
  let(:quantity) { 1 }
  let(:price) { 11.99 }
  subject(:order) { described_class.new }
  let(:message) { "#{quantity} x #{item}. Price: £#{price}" }
  let(:order_message) { "You ordered: \n" + message + "\nTotal of £#{price}\n"}

  it 'is initialized with an empty basket' do
    expect(order.basket).to eq []
  end

describe '#add' do
  it 'lets the customer select items and a quantity from the menu along with the price' do
    expect(order.add(item, quantity, price)).to eq "#{quantity} x #{item}, costing £#{quantity * price} have been added to your order"
  end

  it 'stores the selected items' do
    expect { order.add(item, quantity, price) }.to change{ order.basket.length }.by(1)
  end
end

  it 'calculates the total of the order in the basket' do
    order.add(item, quantity, price)
    expect(order.total).to eq price
  end

  it 'prints the completed order' do
      order.add(item, quantity, price)
      expect{ order.complete_order }.to output(order_message).to_stdout
  end

end

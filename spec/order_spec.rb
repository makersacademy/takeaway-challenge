require 'order'

describe Order do
  let(:item) { double(:item, dish: dish, quantity: quantity) }
  let(:dish) { double(:dish, name: 'Crabs', price: 20.0) }
  let(:quantity) { 5 }

  it 'is an instance of order' do
    expect(subject).to be_an_instance_of Order
  end

  it 'has items' do
    expect(subject).to respond_to :items
  end

  it 'can add items' do
    subject.add(item.dish, quantity)

    found_dish = subject.items.select { |item| item.dish == dish }.length == 1

    expect(found_dish).to eq true
  end

  it 'can calculate total' do
    subject.add(item.dish, quantity)

    expect(subject.total).to eq(dish.price * quantity)
  end
end
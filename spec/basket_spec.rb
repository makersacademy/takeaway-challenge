require 'basket'
require 'formatter'

describe Basket do
  let(:dish) { double(:dish, name: 'Foo soup', price: 2, quantity: 1) }
  it 'can add a new dish' do
    subject.add(dish, 1)
    expect(subject.empty?).to be(false)
  end
  it 'can add to the quantity of an existing dish' do
    subject.add(dish, 1)
    another_dish = double(:another_dish, name: 'Bar mulch', quantity: 1)
    subject.add(another_dish, 1)
    expect(subject.empty?).to be(false)
  end
  it 'can empty itself' do
    subject.add(dish, 1)
    subject.empty
    expect(subject.empty?).to be(true)
  end
  it 'provides a subtotal price' do
    subject.add(dish, 1)
    another_dish = double(:another_dish, name: 'Bar mulch', price: 1, quantity: 1)
    subject.add(another_dish, 1)
    expect(subject.total).to eq(3)
  end
end

require 'basket'

describe Basket do

describe '.initialize' do
  it 'creates the basket with an empty order' do
    expect(subject.basket).to eq({})
  end
end

describe '.add_dish' do
  it 'adds the dish to the order' do
    subject.add_dish("Chips n' Cheese", 1)
    expect(subject.basket).to include "Chips n' Cheese"
  end

  it 'should update quantity if dish already ordered' do
    subject.add_dish('Mighty Meat Pizza', 1)
    subject.add_dish('Mighty Meat Pizza', 1)
    expect(subject.basket).to include 'Mighty Meat Pizza'=>2
  end
end

describe '.total' do
  it 'calculates the correct total' do
    subject.add_dish("Chips n' Cheese", 2)
    subject.add_dish("10 Hot Wings", 1)
    expect(subject.total).to eq(10)
  end
end

end

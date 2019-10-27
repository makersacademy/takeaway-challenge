require 'basket'

describe Basket do
  let(:basket) { Basket.new }

  it 'has empty hash on startup' do
    expect(basket.basket).to be_empty
  end

  it 'adds item to basket' do
    basket.set_basket(:test_dish, 10)
    expect(basket.basket).to eq({ test_dish: 10 })
  end

  it 'appends quantity to already existing key' do
    basket.set_basket(:test_dish, 10)
    basket.set_basket(:test_dish, 1)
    expect(basket.basket).to eq({ test_dish: 11 })
  end

  it 'adds second item to basket' do
    basket.set_basket(:test_dish, 10)
    basket.set_basket(:test_dish, 1)
    basket.set_basket(:second_dish, 1)
    expect(basket.basket).to eq({ test_dish: 11, second_dish: 1 })
  end
 
end

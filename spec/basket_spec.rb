require 'basket'

describe Basket do
  subject(:basket) {described_class.new}

  it 'initialises a basket' do
    expect(basket).to be_a_kind_of(Basket)
  end

  it 'should initialize with an empty basket' do
    expect(basket.basket).to be_empty
  end

  it 'should initialize with an empty total' do
    expect(basket.total).to eq 0
  end

context 'Adding to the basket' do
  before do
    basket.in_basket(1,2)
  end
  it 'should add the item and quantity to basket' do
    expect(basket.basket).to eq([{item: 'Margherita', quantity: 2, cost: 8}])
  end

  it 'should show the current order' do
    expect(STDOUT).to receive(:puts).with("2x Margherita : £8")
    basket.open_basket
  end

  it 'should calculate the total price' do
    expect(STDOUT).to receive(:puts).with("Your total is £16")
    basket.sum_basket
  end
end

end

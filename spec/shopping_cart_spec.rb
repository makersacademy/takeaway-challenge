require 'rspec'
require 'shopping_cart'

describe ShoppingCart do
  DISH1_PRICE = 10
  subject(:shopping_cart) { described_class.new }
  let(:dish1) { double :dish1, price: DISH1_PRICE }

  context '#initialize' do
    it 'is empty' do
      expect(shopping_cart.items).to be_empty
    end
  end

  context '#add' do
    it 'adds an item to the cart' do
      shopping_cart.add(dish1)
      expect(shopping_cart.items).to contain_exactly dish1
    end

    it 'adds the item\'s price to the cart total' do
      expect{ shopping_cart.add(dish1) }.to change { shopping_cart.total }.by DISH1_PRICE
    end
  end

  context '#remove' do
    DISH2_PRICE = 12
    let(:dish2) { double :dish2, price: DISH2_PRICE }

    before do
      shopping_cart.add(dish1)
      shopping_cart.add(dish2)
      shopping_cart.remove(dish1)
    end

    it 'removes an item' do
      expect(shopping_cart.items).not_to contain_exactly dish1
    end

    it 'does not remove other items' do
      expect(shopping_cart.items).to contain_exactly(dish2)
    end

    it 'deducts the removed item\'s price from the cart total' do
      expect{ shopping_cart.remove(dish2) }.to change { shopping_cart.total }.by -DISH2_PRICE
    end
  end

  context '#empty' do
    let(:dish2) { double :dish2, price: DISH2_PRICE }

    before do
      shopping_cart.add(dish1)
      shopping_cart.add(dish2)
      shopping_cart.empty
    end

    it 'is empty' do
      expect(shopping_cart.items).to be_empty
    end

    it 'resets cart total to zero' do
      expect(shopping_cart.total).to eq 0
    end
  end
end
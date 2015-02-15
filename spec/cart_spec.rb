require 'cart'

describe Cart do

  let(:cart) { Cart.new(dish, 5) }
  let(:dish) {double :dish, :price => 3.00}

  it 'should know which dish is added' do
      expect(cart.dish).to eq(dish)
  end

  it 'should should have a quantity of dishes' do
    expect(cart.quantity).to eq 5
  end

  it 'should give a total value' do
    expect(cart.order_total).to eq 15.00
  end


end
require 'cart'

describe Cart do

  let(:dish) {double :dish, :price => 5}

  it 'should know which dish is added' do
    cart = Cart.new(dish)
    expect(cart.dish).to eq(dish)
  end

end
require 'cart'

describe Cart do
  subject { Cart.new }
  it 'is empty upon initialisation' do
    expect(subject.shopping_cart).to be_empty
  end
end

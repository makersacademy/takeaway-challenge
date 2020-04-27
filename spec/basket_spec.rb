require 'basket'
describe Basket do
  subject(:basket) { described_class.new }

  let(:dish1) { { id: 1, name: "Kebap", price: 1.0 } }
  let(:dish2) { { id: 2, name: "Breakfast", price: 2.0 } }

  let(:dishes) do [dish1, dish2] end

  let(:value) { 2 }

  def create_order
    basket.adding(dish1, value)
    basket.adding(dish2, value)
  end

  it '#adds dish and quantity from the menu' do
    create_order
    expect(basket.dishes).to eq dishes
  end

  it 'calculate the total' do
    create_order
    expect(basket.total).to eq 6.0
  end

end

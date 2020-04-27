require 'basket'
describe Basket do
  subject(:basket) {described_class.new}

  let(:dish1) { { id: 1, name: "Kebap", price: 1.0 } }
  let(:dish2) { { id: 2, name: "Breakfast", price: 2.0 } }

 let(:dishes) do [ { id: 1, name: "Kebap", price: 1.0 * value },
                { id: 2, name: "Breakfast", price: 2.0 * value } ] end

  let(:value) { 2 }

  it '#adds dish and quantity from the menu' do
    basket.adding(dish1, value)
    basket.adding(dish2, value)
    expect(basket.dishes).to eq dishes
  end

  it 'calculate the total' do
    basket.adding(dish1, value)
    basket.adding(dish2, value)
    expect(basket.total).to eq 6.0
  end


end

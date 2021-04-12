require 'basket'

describe Basket do
  subject(:basket) { described_class.new }
  let(:meals) { { :"Chicken Katsu" => 2, :"Spring rolls" => 2 } }

  it 'allows to add several items into the basket' do
    basket.add(:"Chicken Katsu", 2)
    basket.add(:"Spring rolls", 2)
    expect(basket.meals).to eq(meals)
  end
end

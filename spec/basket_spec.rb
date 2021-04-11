require 'basket'

describe Basket do
  subject(:basket) { described_class.new }
  let(:store) { { :"Chicken Katsu" => 2 } }

  it 'should add some item in the basket' do
    basket.add(:"Chicken Katsu", 2)
    expect(basket.store).to eq(store)
  end
end

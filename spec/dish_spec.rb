require 'dish'

describe 'dish' do
  let(:pizza) { Dish.new("Pizza", 1.50) }

  context '#name' do
    it 'returns name of dish as a string' do
      expect(pizza.name).to eq("Pizza")
    end
  end

  context '#price' do
    it 'returns a bigdecimal' do
      expect(pizza.price).to be_a(BigDecimal)
    end

    it 'returns the correct price' do
      expect(pizza.price).to eq(1.50)
    end
  end

  context '#to_s' do
    it 'returns a friendly formatted string with name and price' do
      expect(pizza.to_s).to eq("Pizza: £1.50")
    end

  end

end
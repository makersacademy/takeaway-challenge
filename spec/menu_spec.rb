require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  let(:dishes) do {
        edamame: 4,
        chilli_squid: 6,
        duck_wraps: 6,
        steamed_bun: 4,
        chicken_ramen: 10,
        seafood_ramen: 12,
        yasai_ramen: 10
      }
  end

  context 'on initialize' do
    it 'has a list of dishes and prices' do
      expect(subject.dishes).to eq(dishes)
    end
  end

  describe '#list' do
    it 'prints a formatted list of dishes and prices' do
      listed = 'Edamame: £4, Chilli Squid: £6, Duck Wraps: £6, Steamed Bun: £4, Chicken Ramen: £10, Seafood Ramen: £12, Yasai Ramen: £10'
      expect(subject.list).to eq(listed)
    end
  end
end

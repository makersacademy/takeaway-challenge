require 'order'

describe Order do
  let(:subject) { 
    dishes_double = double(:dishes, price_list: { fish: 5, chips: 2, curry_sauce: 1 })
    described_class.new(dishes_double.price_list)
  }

  
  describe '#initialize' do
    it 'accepts and assigns a Dishes price list' do
      expect(subject.price_list).to eq({ fish: 5, chips: 2, curry_sauce: 1 })
    end
  end
end

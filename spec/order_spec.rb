require 'order'

describe Order do
  let(:price_list_double) { double :price_list }
  let(:subject) { 
    dishes_double = double(:dishes, price_list: :price_list_double)
    described_class.new(dishes_double.price_list)
  }

  
  describe '#initialize' do
    it 'accepts and assigns a Dishes price list' do
      expect(subject.price_list).to eq :price_list_double
    end
  end
  
  # descibe '#create' do
    
  # end
end

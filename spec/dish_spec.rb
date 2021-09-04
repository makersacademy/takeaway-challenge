require 'dish'

describe Dish do
  context 'adding a dish' do
    it 'has a #name' do 
      expect(subject.name).to eq("Hash brown")
    end

    it 'has a #price' do 
      expect(subject.price).to eq(99)
    end
  end

  context 'menu format' do
    it 'combines name and price in a hash' do 
      expect(subject.dish_hash).to eq({ :"Hash brown" => "0.99" })
    end
  end
end

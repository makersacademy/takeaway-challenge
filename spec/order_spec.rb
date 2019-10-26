require 'order'

describe Order do

  describe '#add' do
    it 'adds items to basket' do
      subject.add("item", 3)
      expect(subject.basket).to eq({ "item" => 3})
      end
   end
end

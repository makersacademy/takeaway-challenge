require 'order'

describe Order do

  describe '#add' do
    it 'adds items to reciept' do
      subject.add("item", 3)
      expect(subject.receipt).to eq({ "item" => 3})
      end
   end
end

require 'basket'

describe Basket do
  describe '#store' do
    it 'stores item into the basket' do
      expect(subject.store("katsu curry", 1, 6.00)).to eq([{:name=>"katsu curry",:number=>1, :price=>6.00}])
    end
  end

  describe '#show_basket' do
    it 'shows the contents of the basket' do
      subject.store("katsu curry", 1, 6.00)
      expect{subject.show_basket}.to output("katsu curry x 1 = 6.00\n").to_stdout
    end
  end
end

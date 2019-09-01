require 'basket'

describe Basket do
let(:menu_item) {double :menu_item}

  describe '#initialize' do

    it 'initializes with a basket array' do
      expect(subject.basket).to eq([])
    end

    it 'initializes with a total array' do
      expect(subject.total).to eq([])
    end

  end

  describe '#view_basket' do

    it 'returns what is in the basket with quantities' do
      subject.basket << menu_item
      subject.total << 4.99
      expect{subject.view_basket}.to output("1x #[Double :menu_item]\nSubtotal: £4.99\n").to_stdout
    end

  end
end
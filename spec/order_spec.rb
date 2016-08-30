require 'order'

describe Order do
  let(:quantity)      { double :quantity }

  context '#add_item' do
    it 'raises an error when selected item is not from the menu' do
      msg = "Selsected dish is not from our menu"
      expect{ subject.add_dish("banana", quantity) }.to raise_error msg
    end

    it 'adds a selected item to the current order' do
      subject.add_dish("pasta", quantity)
      expect(subject.currnet_order).to include ["pasta", quantity]
    end
  end


  context '#claculate_price' do
    it 'calculates the total' do
      subject.add_dish("pasta", 2)
      subject.add_dish("pizza", 1)
      expect(subject.claculate_price).to eq 11
    end
  end

end

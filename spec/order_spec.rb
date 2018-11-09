require 'order'

describe Order do
  let(:dish) { double :dish, name: 'food', price: 1 }

  it 'shows an empty array when asked what has been orderd so far' do
    expect(subject.ordered).to eq([])
  end

  describe '#show_order' do
    it 'shows a list of all ordered item names' do
      subject.ordered << { dish => 3 }
      expect(STDOUT).to receive(:puts).with("3x food, £1")
      subject.show_order
    end

    it 'raises an error if nothing is ordered' do
      error = 'nothing has been ordered yet'
      expect { subject.show_order }.to raise_error(error)
    end
  end

  describe '#show_total' do
    it 'shows the total cost of all ordered items' do
      subject.ordered << { dish => 3 }
      expect(STDOUT).to receive(:puts).with("Total cost is £3")
      subject.show_total
    end

    it 'raises an error if nothing is ordered' do
      error = 'nothing has been ordered yet'
      expect { subject.show_order }.to raise_error(error)
    end
  end

end

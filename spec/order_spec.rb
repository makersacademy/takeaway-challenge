require 'order'

describe Order do
  let(:dish) { double :dish, name: 'food', price: 1 }

  it 'shows an empty array when asked what has been orderd so far' do
    expect(subject.ordered).to eq([])
  end

  describe '#show_order' do
    it 'shows a list of all ordered item names' do
      3.times { subject.ordered << dish }
      3.times { expect(STDOUT).to receive(:puts).with("food") }
      subject.show_order
    end
  end

  describe '#show_total' do
    it 'shows the total cost of all ordered items' do
      3.times { subject.ordered << dish }
      expect(STDOUT).to receive(:puts).with("Total cost is £3")
      subject.show_total
    end
  end

end

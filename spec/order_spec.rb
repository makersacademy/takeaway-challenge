require 'order'

describe Order do
  let(:add_1_salmon) { subject.add_item({ :salmon => 10 }, 1) }
  let(:add_3_salmons) { subject.add_item({ :salmon => 10 }, 3) }
  it 'inits with empty basket' do
    expect(subject.basket).to eq([])
  end

  describe '#add_item' do
    it 'pushes single item into basket' do
      add_1_salmon
      expect(subject.basket).to eq([{ salmon: 10 }])
    end

    it 'pushes multiple items into basket' do
      add_3_salmons
      expect(subject.basket).to eq([{ salmon: 10 }, { salmon: 10 }, { salmon: 10 }])
    end
  end

  describe '#total' do
    it 'returns the total cost of items in the basket' do
      add_3_salmons
      expect { subject.total_print }.to output("Total: £30.00\n").to_stdout
    end
  end

  describe '#verify' do
    it 'prints current basket contents in a readable format' do
      add_3_salmons
      expect { subject.verify }.to output("Your current basket:\nSalmon : £10.00\nSalmon : £10.00\nSalmon : £10.00\nTotal: £30.00\n").to_stdout
    end
  end
end

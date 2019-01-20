require 'basket'

describe Basket do
  let(:menu) { double(:menu, choose: { number: 1, name: 'Curry', price: 5 }) }
  describe '#add' do
    it 'responds to add' do
      expect(subject).to respond_to(:add).with(1).argument
    end
    it 'has an empty basket' do
      expect(subject.contents).to eq([])
    end
    it 'adds a dish to the basket' do
      subject.add(1)
      expect(subject.contents).to include({ number: 1, name: 'Curry', price: 5, quantity: 1 })
    end
    it 'adds 2 dishes to the basket' do
      subject.add(1)
      subject.add(1)
      expect(subject.contents).to include({ number: 1, name: 'Curry', price: 5, quantity: 2 })
    end
  end
  describe '#sub_total' do
    it 'shows the sub-total of the basket' do
      subject.add(1)
      subject.add(2)
      subject.add(2)
      expect { subject.sub_total }.to output("Here is your sub-total so far:\nCurry - £5 x 1\nRice - £2 x 2\nSub-total: £9\n").to_stdout
    end
  end
end

require 'basket'

describe Basket do
  describe '#add' do
    let(:menu) { double(:menu, choose: { number: 1, name: 'Curry', price: 5 }) }
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
end

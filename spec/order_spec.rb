require 'order'

describe Order do

  # Mocks
  let(:dish) { double(:dish, price: 12.99) }

  describe '#initialize' do
    it 'has an empty cart' do
      expect(subject.cart).to eq({})
    end

    it 'has a Total defaulted in 0' do
      expect(subject.total).to eq 0
    end

    it 'has a status defaulted to "new"' do
      expect(subject.status).to eq :new
    end
  end

  describe '#add' do
    before(:each) { subject.add(dish, 2) }
    context 'when a dish is ordered once' do
      it 'adds a dish to the cart' do
        expect(subject.cart).to eq({ dish => 2 })
      end
    end

    context 'when a dish is ordered a second time' do
      it 'updates the quantity' do
        subject.add(dish, 2)
        expect(subject.cart).to eq({ dish => 4 })
      end
    end

    context 'every time an ordered is placed' do
      it 'updates the total' do
        expect(subject.total).to eq 25.98
      end
    end
  end

  describe '#canceled' do
    before(:each) { subject.canceled }
    it 'changes the status to canceled' do
      expect(subject.status).to eq :canceled
    end
  end

  describe 'payed' do
    before(:each) { subject.payed }
    it 'changes the status to canceled' do
      expect(subject.status).to eq :payed
    end
  end
end

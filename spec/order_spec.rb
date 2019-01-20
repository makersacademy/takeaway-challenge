require 'order'

describe Order do
  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:chips, price: 2, name: "Chips") }

  describe '#store' do

    it 'should store dishes in the order' do
      subject.add(pizza)
      expect(subject.order).to include(pizza)
    end

    it 'should start with an empty order' do
      expect(subject.order).to be_empty
    end

  end

  describe '#total' do

    it 'should give me the total of what is in the order' do
      subject.add(pizza)
      subject.add(chips)
      expect(subject.total).to eq 12
    end
  end

  describe '#contents' do

    it 'should give the contents for the dish in order' do
      subject.add(pizza)
      expect(subject.contents).to eq "Pizza"
    end

    it 'should give the contents for multiple dishes in the order' do
      subject.add(pizza)
      subject.add(chips)
      expect(subject.contents).to eq "Pizza\nChips"
    end

  end

end

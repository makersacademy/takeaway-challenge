require 'order'

describe Order do
  let(:dish1) { double("dish1", price: 1.00) }
  let(:dish2) { double("dish2", price: 2.00) }
  let(:dish3) { double("dish3", price: 3.00) }

  context 'When initialized' do
    it 'it creates an empty list' do
      expect(subject.list).to eq []
    end
  end

  describe '#add' do
    it 'adds an item to the order' do
      subject.add(dish1)
      expect(subject.list).to eq [dish1]
    end

    it 'adds multiple items to the order at once' do
      subject.add(dish1,dish2)
      expect(subject.list).to eq [dish1, dish2]
    end
  end

  describe '#total' do
    it 'gets a total price for the order' do
      subject.add(dish1,dish2)
      expect(subject.total).to eq (dish1.price + dish2.price)
    end
  end

  describe '#clear' do
    it 'clears the current order' do
      subject.add(dish1,dish2,dish3)
      expect{subject.clear}.to change{subject.list}.to be_empty
    end
  end
end

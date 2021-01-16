require 'order'

describe Order do

  describe '#initialize' do

    it 'should be empty when initialized' do
      expect(subject.orders).to eq([])
    end
  end

  describe '#add' do

    it 'responds to add' do
      expect(subject).to respond_to(:add)
    end

    it 'should store the added dishes' do
      expect(subject.add("Pork", 1, 7)).to eq([dish: "Pork", quantity: 1, price: 7])
    end
  end

  describe '#total' do
    it 'should return the correct total' do
      subject.add("Pork", 1, 7)
      subject.add("Sushi", 3, 15)
      expect(subject.total).to eq(52)
    end
  end
end

require 'costumer'
describe Costumer do
  let(:menu) {double :menu, show: { cheese_burger: 5,
                                    hotdog:        4,
                                    lasagne:       5,
                                    beer:          2,
                                    coke:          2,
                                    cheese_cake:   3}}
  subject {Costumer.new(menu)}
  it 'has a basket' do
    expect(subject.basket).to eq({})
  end

  describe 'select' do
    it 'can select an item from a menu' do
      expect(subject.add(:cheese_burger)).to eq({cheese_burger: 5})
    end

    it 'can select multiple quantities from the same dish' do
      expect(subject.add(:cheese_burger,2)).to eq({cheese_burger: 10})
    end
  end

  describe 'total' do
    it 'returns the total' do
      subject.add(:cheese_burger,2)
      subject.add(:coke,2)
      expect(subject.total).to eq 14
    end
  end
end

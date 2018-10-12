require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#add_items' do

    it 'can add a single item' do
      subject.add_items('pizza', 1)
      expect(subject.basket).to eq({ 'pizza' => 1 })
    end

    it 'Can add a single item with a quantity greater than 1' do
      subject.add_items('pizza', 2)
      expect(subject.basket).to eq({ 'pizza' => 2 })
    end

    it 'Can add multiple items' do
      subject.add_items('pizza', 1)
      subject.add_items('burger', 1)
      expect(subject.basket).to eq({ 'pizza' => 1, 'burger' => 1 })
    end

    it 'Can add multiple items of variable quantities' do
      subject.add_items('pizza', 1)
      subject.add_items('burger', 2)
      expect(subject.basket).to eq({ 'pizza' => 1, 'burger' => 2 })
    end

    it 'The same item can be added multiple times' do
      subject.add_items('burger', 1)
      subject.add_items('pizza', 1)
      subject.add_items('burger', 1)
      expect(subject.basket).to eq({ 'burger' => 2, 'pizza' => 1 })
    end

  end
end

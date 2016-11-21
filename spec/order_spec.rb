require 'order'

describe Order do

  subject(:order) {described_class.new(menu)}
  let(:menu) {instance_double("Menu")}
  let(:menu_list) do {curry: 9, burger: 8} end

  describe '#initialization' do

    it 'basket is empty to begin with' do
      expect(subject.basket).to be_empty
    end

  end

  describe '#add' do

    it 'raises an error if an invalid item is entered' do
      allow(menu).to receive(:does_not_contain?).with(:apple).and_return(true)
      expect{subject.add(:apple,1)}.to raise_error NoItemError, 'Not on the menu'
    end

    it 'adds items to the basket' do
      allow(menu).to receive(:does_not_contain?).with(:curry).and_return(false)
      subject.add(:curry,1)
      subject.add(:curry,2)
      basket = {curry: 3}
      expect(subject.basket).to eq basket
    end

  end

  describe '#total' do

    it 'returns the total cost of the order' do
      allow(menu).to receive(:dishes).and_return(menu_list)
      allow(menu).to receive(:does_not_contain?).with(:curry).and_return(false)
      allow(menu).to receive(:does_not_contain?).with(:burger).and_return(false)
      subject.add(:curry,2)
      subject.add(:burger,3)
      expect(subject.total).to eq 42
    end

  end

end

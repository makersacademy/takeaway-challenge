require 'order'

describe Order do

  subject(:order) {described_class.new(menu)}
  let(:menu) {double :menu, list: menu_list}
  let(:menu_list) {{"Curry" => 9, "Burger" => 8}}

  describe '#initialization' do

    it 'basket is empty to begin with' do
      expect(subject.basket).to be_empty
    end

  end

  describe '#add' do

    it 'raises an error if not an invalid item is entered' do
      allow(menu).to receive(:does_not_contain?).with("Apple").and_return(true)
      expect{subject.add("Apple",1)}.to raise_error 'Not on the menu'
    end

    it 'adds items to the basket' do
      allow(menu).to receive(:does_not_contain?).with("Curry").and_return(false)
      subject.add("Curry",1)
      subject.add("Curry",2)
      basket = {"Curry" => 3}
      expect(subject.basket).to eq basket
    end

  end

  describe '#total' do

    it 'returns the total cost of the order' do
      allow(menu).to receive(:does_not_contain?).with("Curry").and_return(false)
      allow(menu).to receive(:does_not_contain?).with("Burger").and_return(false)
      subject.add("Curry",2)
      subject.add("Burger",3)
      expect(subject.total).to eq 42
    end

  end

end

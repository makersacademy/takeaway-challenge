require 'menu'

describe Menu do
  subject { described_class.new }
  let(:order) { {'formule1' => 2, 'drink' => 2} }

  describe '#print' do
    it 'print the menu' do
      expect(subject.print).to eq(Menu::LIST_OF_DISHES)
    end
  end

  describe '#select' do
    it 'checks if dishes are in the menu - hardcoded values' do
      expect((Menu::LIST_OF_DISHES).keys).to include *order.keys
    end
  end

  describe '#checkout' do

    it 'raises an error if the inputed total is not equal to the real total' do
       subject.select(['formule1', 'formule2', 'drink'], [1,1,2], 32)
       expect{subject.checkout}.to raise_error('The sum is incorrect!')
    end

    it 'moves on if the inputed total is equal to the real total' do
      subject.select(['formule1', 'formule2', 'drink'], [1,1,2], 35)
      expect(subject.checkout).to include 'Thank you! Your order was placed and will be delivered before 18:52'
    end
  end

end

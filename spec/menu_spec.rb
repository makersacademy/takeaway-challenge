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
    it 'raises an error if the dish not in the menu' do
      expect{subject.select('and',2)}.to raise_error 'Dish not in the menu, try again!'
    end
  end

  describe '#checkout' do

    it 'raises an error if the inputed total is not equal to the real total' do
       subject.select('formule1', 1)
       subject.select('drink', 2)
       expect{subject.checkout(21)}.to raise_error('The sum is incorrect!')
    end

    before do
      subject.select('formule1', 1)
      subject.select('formule2', 1)
      allow(subject.sms).to receive(:send)
    end
    it 'sends text if the total is correct' do
      expect(subject.sms).to receive(:send).with('Thank you! Your order is confirmed, it will arrive in an hour!')
      subject.checkout(25)
      end
    end


end

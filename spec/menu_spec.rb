require 'menu'


describe Menu do
  describe '#check_menu' do
    it 'prints a list of the menu, items and costs' do
      expect(subject.check_menu).to eq "Chips: £1 \nBurger: £2 \n"
    end
  end
  describe '#cost' do
    it 'returns the cost of a certain dish' do
      expect(subject.cost("Chips", 1)).to eq 1
    end
  end
end

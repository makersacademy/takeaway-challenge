require 'menu'

describe Menu do

  describe '#view' do
    it 'should display a list of dishes with prices' do
      expect(subject.view).to eq "1. Pie - £6\n2. Mash - £4\n3. Chips - £5"
    end
  end
  describe '#provide_dish' do
    it 'returns a Pie object when passed 1' do
      expect(subject.provide_dish(1)).to be_kind_of(Pie)
    end
    it 'returns a Mash object when passed 2' do
      expect(subject.provide_dish(2)).to be_kind_of(Mash)
    end
    it 'returns a Chips object when passed 3' do
      expect(subject.provide_dish(3)).to be_kind_of(Chips)
    end
    it 'raises error when passed a number outside of the menu' do
      expect { subject.provide_dish(Menu::MENU_LENGTH + 1) }.to raise_error "That number isn't an item on the menu"
    end
  end
end
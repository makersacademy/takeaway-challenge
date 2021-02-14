require 'order'

describe Order do

  before do
    @menu = Menu.new
  end

  describe '#read_menu' do
    it 'should return the menu' do
      expect(subject.read_menu).to eq(@menu.menu)
    end
  end

  describe '#add' do
    it 'should take 2 arguments' do
      expect(subject).to respond_to(:add).with(2).arguments
    end

    it 'should add the selected dish and amount to the basket' do
      first_item = subject.add("1. Bhindi", 5)
      expect(subject.basket).to be(first_item)
    end
  end

end

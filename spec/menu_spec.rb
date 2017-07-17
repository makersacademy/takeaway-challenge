require 'menu'

describe Menu do

  subject(:menu) { described_class.new("Tonkotsu Ramen", 10) }

  describe '#initialize' do
    it 'has a dish variable' do
      expect(subject.dish).to eq "Tonkotsu Ramen"
    end

    it 'has a price variable for each dish' do
      expect(subject.price).to eq 10
    end
  end

  describe '#read_menu_list' do

    it 'shows the dish and price' do
      expect(subject.read_menu_list).to eq "Tonkotsu Ramen: £10"
    end
  end

  describe '#menu_list' do
    it 'lists all avaialable dishes and prices in a menu list' do
      expect(subject.menu_list).to eq ["Tonkotsu Ramen: £10"] #, "Miso Chicken: £8\n", "Veggie Ramen: 7\n", "Dracula Tonkotsu: 6"
    end
  end
end

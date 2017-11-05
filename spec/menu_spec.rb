require 'menu'

describe Menu do

  let(:menu) do
    menu = []
    CSV.foreach("menu.csv") do |row|
      name, price = row
      menu << { name: name, price: price.to_i }
    end
    menu
  end

  describe '#menu' do
    it 'gets the menu from csv file' do
      expect(subject.menu).to eq menu
    end
  end

  describe '#items' do
    it 'returns string with food items' do
      expect(subject.items).to eq "Bolognese £6\nPizza £8\nChips £2\nChicken £3\nHamburger £4\nDonner Wrap £6\nNuggets £3\nMozzarella Sticks £5\nDeep-fried Mars Bar £1\nFish £5"
    end
  end
  
end

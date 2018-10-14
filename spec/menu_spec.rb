require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  let(:kungpaochicken) { instance_double Dish, dish_name: 'Kung Pao Chicken', price: 10 }
  let(:beeflomein) { instance_double Dish, dish_name: 'Beef Lo Mein', price: 12 }
  let(:friedrice) { instance_double Dish, dish_name: 'Fried Rice', price: 7 }
  let(:mockMenu) { described_class.new([kungpaochicken, beeflomein, friedrice]) }

  describe '#initialize' do
    it 'defaults with no dishes' do
      expect(subject.dishes).to be_empty
    end

    it 'allows dishes to be added' do
      expect(mockMenu.dishes).to eq [kungpaochicken, beeflomein, friedrice]
    end
  end

  describe '#list_menu' do
    it 'raises error message if menu is empty' do
      expect { subject.list }.to raise_error 'This menu is empty'
    end

    it 'lists menu items' do
      expect(mockMenu.list).to eq [kungpaochicken, beeflomein, friedrice]
    end
  end

end

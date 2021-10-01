require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  # let(:mapotofu) { instance_double(Dish, :name => 'Mapo Tofu', :price => 5.00)}
  let(:mapotofu) { double :dish, :name => 'Mapo Tofu', :price => 5.00 }
  let(:gongbaotofu) { double :dish, :name => 'Gongbao Tofu', :price => 4.50 }

  describe '#list' do
    it 'has a menu of dishes' do
      expect(menu.dishes).to eq([])
    end
    it 'prints the menu' do
      menu.add(mapotofu)
      expect(menu.list).to eq("#{mapotofu.name} | #{mapotofu.price}")
    end
  end
  describe '#add' do
    it 'can add a dish with name and price to the menu' do
      menu.add(mapotofu)
      expect(menu.dishes).to eq([mapotofu])
    end
  end
  describe '#remove' do
    it 'can remove a dish from the menu' do
      menu.add(mapotofu)
      menu.remove(mapotofu)
      expect(menu.dishes).to eq([])
    end
  end
end

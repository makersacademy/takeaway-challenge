require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:dish1) { double :dish, name: 'pizza', price: 5 }
  let(:dish2) { double :dish, name: 'pasta', price: 4 }

  context '#add_dish' do
    it 'adds hash to dishes array' do
      menu.add_dish(dish1)

      expect(menu.dishes).to include({ name: dish1.name, price: dish1.price })
    end
  end

  context '#show_menu' do
    it 'shows all dishes' do
      menu.add_dish(dish1)
      menu.add_dish(dish2)

      expect(menu.show_menu).to eq("Pizza: £5\nPasta: £4")
    end
  end

  context '#on_menu?' do
    it 'returns true if dish on menu' do
      menu.add_dish(dish1)
      expect(menu.on_menu?(dish1)).to eq true
    end

    it 'returns false if dish not on menu' do
      expect(menu.on_menu?(dish1)).to eq false
    end
  end
end

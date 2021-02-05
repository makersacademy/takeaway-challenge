require 'menu'
require 'dish'
require 'viewer'

peperoni = Dish.new('Peperoni', 700)
kiev = Dish.new('Pollo Kiev', 800)
margherita = Dish.new('Margherita', 500)
pizzeria = Menu.new(peperoni, kiev)

describe Menu do
  describe '#view_menu' do
    it 'allows the customer to view a list of available dishes' do
      expect(pizzeria.view_menu).to eq [{ 'Peperoni' => '£7.00' }, { 'Pollo Kiev' => '£8.00' }]
    end
  end

  describe '#add' do
    pizzeria.add_to_order(peperoni)
    it 'lets the customer add meals to their order' do
      expect(pizzeria.view_cart).to eq [{ 'Peperoni' => '£7.00' }]
    end

    it 'guards against the system adding items that are not on the menu' do
      expect { pizzeria.add_to_order(margherita) }.to raise_error 'item not on menu'
    end
  end
end

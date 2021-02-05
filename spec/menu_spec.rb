require 'menu'
require 'dish'
require 'viewer'

peperoni = Dish.new('Peperoni', 700)
kiev = Dish.new('Pollo Kiev', 800)

describe Menu do
  describe '#view' do
    it 'allows the customer to view a list of available dishes' do
      pizzeria = Menu.new(peperoni, kiev)
      expect(pizzeria.view).to eq [{'Peperoni' => '£7.00'}, {'Pollo Kiev' => '£8.00'}]
    end
  end

  describe '#add' do
    
  end
end
require 'menu'
require 'dish'
require 'viewer'
require 'sms_sender'

peperoni = Dish.new('Peperoni', 700)
kiev = Dish.new('Pollo Kiev', 800)
margherita = Dish.new('Margherita', 500)
bolognese = Dish.new('Bolognese', 700)
four_seasons = Dish.new('Four Seasons', 650)

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
      expect(pizzeria.view_cart).to eq [[{ 'Peperoni' => '£7.00' }], '£7.00']
    end

    it 'guards against the system adding items that are not on the menu' do
      expect { pizzeria.add_to_order(margherita) }.to raise_error 'item not on menu'
    end
  end

  describe '#view_cart' do
    pizzeria_ii = Menu.new(peperoni, kiev, margherita, bolognese, four_seasons)
    pizzeria_ii.add_to_order(peperoni)
    pizzeria_ii.add_to_order(margherita)
    pizzeria_ii.add_to_order(four_seasons)
    it 'customer knows they have correct price for order as #view_cart automatically calculates this' do
      expect(pizzeria_ii.view_cart).to eq [[{ 'Peperoni' => '£7.00' }, { 'Margherita' => '£5.00' }, { 'Four Seasons' => '£6.50' }], '£18.50']
    end
  end

  describe '#place_order' do
    pizzeria_ii = Menu.new(peperoni, kiev, margherita, bolognese, four_seasons)
    pizzeria_ii.add_to_order(kiev)
    let(:pizzeria_ii) { double :pizzeria_ii, place_order: "Thank you! Your order was placed and will be delivered before 18:52" }
  
    it 'also provides SMS confirmation once order has been received by takeout' do
      expect(pizzeria_ii.place_order).to eq 'Thank you! Your order was placed and will be delivered before 18:52'
    end
  end
end

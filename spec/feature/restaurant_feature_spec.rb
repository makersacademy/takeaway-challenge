require 'restaurant'

describe Restaurant do
  subject(:restaurant){described_class.new}

  xdescribe '#show_menu' do

    it 'outputs the list of menu items' do
      expect(restaurant.show_menu).to include(Restaurant::MENU)
    end

  end

  describe '#place_order' do

    it 'add the item to the order and confirms' do
      restaurant.show_menu
      expect(restaurant.place_order("prawn summer rolls", 4)).to eq("4 prawn summer rolls, added to your order")
    end

    it 'allows multiple orders to be placed' do
      restaurant.show_menu
      restaurant.place_order("prawn summer rolls", 4)
      restaurant.place_order("chicken satay", 3)
      restaurant.place_order("salt and pepper squid", 2)
      expect(restaurant.show_order).to eq("4 prawn summer rolls, 3 chicken satay, 2 salt and pepper squid, total 42.9")
    end

    it 'maintains the current Order if the menu is viewed again' do
      restaurant.show_menu
      restaurant.place_order("prawn summer rolls", 4)
      restaurant.show_menu
      expect(restaurant.show_order).to eq("4 prawn summer rolls, total 22.4")
    end

  end

  describe '#show_order' do

    it 'returns the items that have been ordered and the price' do
      restaurant.show_menu
      restaurant.place_order("prawn summer rolls", 4)
      expect(restaurant.show_order).to eq("4 prawn summer rolls, total 22.4")
    end

  end


  describe '#confirm_order' do

    it 'sends a text to confirm the order was placed' do
      restaurant.show_menu
      restaurant.place_order("prawn summer rolls", 4)
      expect(restaurant.confirm_order(22.4)).to eq("Your order has been confirmed")
    end

  end


end

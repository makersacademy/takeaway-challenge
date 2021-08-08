require 'order'

describe Order do

  let(:full_menu) { double( items: [ 
    { dish: "Pepperoni", price: 12, selected: 0 },
    { dish: "4 Cheeses", price: 11, selected: 0 },
    { dish: "BBQ Meat Feast", price: 13, selected: 0 },
    { dish: "Magherita", price: 10, selected: 0 } ] 
  )}

  subject(:order)       { described_class.new(menu_class: full_menu) }

  describe '#list_menu' do

    it 'is expected to output a list of menu items with price' do
      expect { order.list_menu }.to output { "Pepperoni - 12\n4 Cheeses - 11\nBBQ Meat Feast - 13\nMagherita - 10" }.to_stdout
    end

  end

  describe '#choose' do

    it "raises an error if User tries to put the dish selection below zero" do
      expect { order.choose("Pepperoni", -1) }.to raise_error { "You can't have a selected dish go into negative" }
    end

    it "doesn't raise an error if User wants to remove an item" do
      order.choose("Pepperoni")
      expect { order.choose("Pepperoni", -1) }.to_not raise_error { "You can't have a selected dish go into the negatives" }
    end

    # this is not testing what I want and am not sure how to do it correctly
    it 'can select a dish' do
      expect { order.choose("Pepperoni") }.to change { order.basket.length }.by (1)
    end

    it 'can select a multiple dishes' do
      order.choose("Pepperoni")
      expect { order.choose("4 Cheeses", 3) }.to change { order.basket.length }.by (2)
    end

  end

  # describe '#remove_from_basket' do

  #   it 'removes the selected item from the basket' do

  #   end

  # end

  describe '#verify_basket' do

    it 'outputs the contents of the basket' do
      order.choose("Pepperoni", 4)
      expect { order.verify_basket }.to output.to_stdout
    end

  end

  describe '#total_price' do

    it 'outputs the sum total of the basket' do
      order.choose("Pepperoni", 4)
      expect { order.total_price }.to output.to_stdout
    end

  end


end
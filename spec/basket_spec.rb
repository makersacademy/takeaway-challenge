require 'basket'

describe Basket do
  subject(:basket) { described_class.new }
  let(:menu) { double(:menu, dishes: { "Pepperoni"=> 7.50, "Vegetarian"=> 7.00 } ) }


  describe '#add_to_basket' do
    it 'adds an item to the basket' do
      basket.add_to_basket("Pepperoni", 1)
      expect(basket.my_order).to include("Pepperoni")
    end
  end

  describe '#remove_from_basket' do
    it 'raises an error if the item is not in the order' do
      message = "Sorry, the item selected is not in your order"
      expect { basket.remove_from_basket("Pepperoni", 1) }.to raise_error message
    end

    it 'raises an error if you try to remove more than ordered' do
      message = "Sorry, you can't remove more than you've ordered"
      basket.add_to_basket("Pepperoni", 1)
      expect { basket.remove_from_basket("Pepperoni", 2) }.to raise_error message
    end

    it 'removes an item from the basket' do
      basket.add_to_basket("Pepperoni", 3)
      expect { basket.remove_from_basket("Pepperoni", 1) }.to change {basket.my_order["Pepperoni"]}.from(3).to(2)
    end
  end

  describe '#display_order' do
    it 'raises an error if the basket is empty' do
      message = "Your basket is empty"
      expect { basket.display_order(menu) }.to raise_error message
    end

    it 'displays the order' do
      basket.add_to_basket("Pepperoni", 2)
      message = "Pepperoni pizza x2 = £15.00"
      expect(basket.display_order(menu)).to eq(message)
    end
  end

  describe '#order_total' do
    it 'gives the order total as an integer' do
    basket.add_to_basket("Pepperoni", 2)
    expect(basket.order_total(menu)).to eq(15)
    end
  end

end

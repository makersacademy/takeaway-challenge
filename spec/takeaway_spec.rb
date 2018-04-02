require 'takeaway'
require 'basket'
require 'menu'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  # describe '#view_menu' do
  #   it 'shows the menu available' do
  #     allow(takeaway).to receive(:readable_menu).and_return( { "Pepperoni})
  #     expect(takeaway.view_menu).to eq(printed_text)
  #   end
  # end

  describe '#add_item' do

    it 'adds an item to my order' do
      message = "1 x Pepperoni pizza(s) added to your basket"
      expect(takeaway.add_item("Pepperoni")).to eq message
    end

    it 'raises an error if the item is not on the menu' do
      message = "Sorry, that is not available on the menu"
      expect { takeaway.add_item("Chicken") }.to raise_error message
    end
  end

  describe '#remove_item' do

    it 'removes an item from my_order' do
      message = "1 x Pepperoni pizza(s) removed from your basket"
      takeaway.add_item("Pepperoni", 3)
      expect(takeaway.remove_item("Pepperoni", 1)).to eq message
    end

    it 'raises an error if the quantity removed is more than the quantity in my_order' do
      message = "Sorry, you can't remove more than you've ordered"
      item = "Pepperoni"
      takeaway.add_item(item)
      expect { takeaway.remove_item(item, 2) }.to raise_error message
    end

    it 'raises an error if the item is not in my_order' do
      message = "Sorry, the item selected is not in your order"
      item = "Pepperoni"
      expect { takeaway.remove_item("Pepperoni") }.to raise_error message
    end
  end

  describe '#view_basket' do
    it 'shows whats in the basket' do
      message = "Pepperoni pizza x2 = £15.00"
      takeaway.add_item("Pepperoni", 2)
      expect(takeaway.view_basket).to eq message
    end
  end

  describe '#total_bill' do
    it 'shows the total for the order' do
      message = "Your total bill is £15.00."
      takeaway.add_item("Pepperoni", 2)
      expect(takeaway.total_bill).to eq message
    end
  end

  # describe '#checkout' do
  #   it 'raises an error when the user enters a value that doesnt match the total bill' do
  #     takeaway.add_item("Pepperoni", 2)
  #
  #   end
  # end

end

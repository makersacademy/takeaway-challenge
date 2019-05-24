require 'order'

describe Order do
  let(:order) { Order.new }

  describe 'set up' do
    it 'creates a new instance of Order' do

    end

    it 'has a gettable order array' do

    end
  end

  describe 'add items' do
    context 'item is available in the menu' do
      it 'can add to order from menu' do

      end

      it ' can add multiple items to my order' do

      end

      it 'can add different quantities of an item' do

      end

      it 'can add different quantities of different items' do

      end
    end

    context 'item isn\'t available in the menu' do
      it ' errors when you try to add an item not available in the menu' do

      end
    end
  end

  describe 'remove items' do
    context 'has items to remove' do
      it 'can remove a food item from my order' do

      end

      it ' can remove multiple items from my order' do

      end

      it 'can remove multiple quantities of an item' do

      end

      it 'can remove multiple quantities of multiple items' do

      end
    end

    context 'doesn\'t have enough items to remove' do
      it 'errors when you try remove an item from an empty order' do

      end

      it 'errors when you try to remove more items than you have quantity' do

      end
    end
  end

  describe 'checking my order' do
    it 'can display the names and prices of my order items' do

    end

    it 'can display the total price of each item based on quantity' do

    end

    it 'can display the total price of all items' do

    end

    it 'total price of order matches sum of item prices'  do

    end
  end
end

require 'menu'
require 'order_form'

describe OrderForm do

  #let(:menu_reference) { double('menu_reference') }

  describe 'add' do

    it 'adds items to the tab' do
      order_form = OrderForm.new(Menu.new)
      #allow(menu_reference).to receive(:menu)
      expect { order_form.add("Chicken Rice", 1) }.to change { order_form.tab.length }.by(1)
    end

    it 'adds items to the tab multiplied by the quantity' do
      order_form = OrderForm.new(Menu.new)
      expect { order_form.add("Oolong Tea", 3) }.to change { order_form.tab.length }.by(3)
    end

    it 'adds the price of the added item to the total' do
      order_form = OrderForm.new(Menu.new)
      expect { order_form.add("Hokkien Mee", 1) }.to change { order_form.total }.by(4)
    end

    it 'adds just 1 item to the tab if quantity is not specified' do
      order_form = OrderForm.new(Menu.new)
      expect { order_form.add("Hokkien Mee") }.not_to raise_error
    end
  end

  describe 'remove' do

    it 'removes items from the tab' do
      order_form = OrderForm.new(Menu.new)
      order_form.tab << "Oolong Tea"
      expect { order_form.remove("Oolong Tea", 1) }.to change { order_form.tab.length }.by(-1)

    end

    it 'removes items from the tab multiplied by the quantity' do
      order_form = OrderForm.new(Menu.new)
      order_form.add("Oolong Tea", 2)
      expect { order_form.remove("Oolong Tea", 2) }.to change { order_form.tab.length }.by(-2)
    end

    it 'subtracts the price of the removed item from the total' do
      order_form = OrderForm.new(Menu.new)
      order_form.add("Oolong Tea", 2)
      expect { order_form.remove("Oolong Tea", 2) }.to change { order_form.total }.by(-2)

    end
  end

  describe 'place_order' do

    it 'produces a receipt for you to verify that the total matches the sum of the various dishes in the order, and pay after verifying' do
      order_form = OrderForm.new(Menu.new)
      order_form.add("Oolong Tea", 3)
      order_form.remove("Oolong Tea", 1)
      order_form.remove("Oolong Tea", 2)
      order_form.add("Chicken Rice")
      order_form.add("Laksa", 2)
      order_form.add("Hokkien Mee", 3)
      closing = "The total will be $20. Kindly make payment after verifying that it matches the sum of the prices of the dishes that you ordered."
      expect(order_form.place_order).to eq closing

    end
  end

end
require 'Takeaway.rb'

describe Takeaway do

  let(:menu) { double :menu }
  let(:order) { double :order }

  describe '#menu' do
    it 'stores a list of all dishes and prices' do
      menu = [["doner", 5], ["burger", 10], ["pizza", 20]]
      allow(subject).to receive(:menu).and_return([["doner", 5], ["burger", 10], ["pizza", 20]])
    end
  end

  describe '#show_menu' do
    it 'displays menu items to customer' do
      menu = [["doner", 5], ["burger", 10], ["pizza", 20]]
      allow(subject.show_menu(menu)).to receive(:menu).and_return("doner 5\nburger 10\npizza 20")
    end
  end

  describe '#order_food' do
    it 'selects the food for each order' do
      menu = [["doner", 5], ["burger", 10], ["pizza", 20]]
      order = [menu[0]*2]
      allow(subject.order_food(order)).to receive(:order).and_return("doner 5\ndoner 5")
    end
  end

end

# order_sum inegers vs amount

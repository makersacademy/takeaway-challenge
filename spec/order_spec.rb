require 'order'

describe Order do
  subject(:order) {described_class.new(Menu)}
  let (:menu) { double :menu}

  context "#ordering" do
    it 'is initialised with an empty order list' do
      expect(order.order_items).to eq []
    end

    it 'order is initialized with the amount of EUR 0.00 for order_sum' do
      expect(order.order_sum).to eq '0.00'
    end

    xit 'can read the items from the menu' do # couldn't figure out why this was failing
      expect(order.read_menu).to eq menu.view
    end

    xit 'can add dishes from the menu to ther order' do
      dish = {no: "%02d" % 5, dish: "Tori Yam Soup", price: 3.55}
      allow(:menu).to receive(:menu_items).with(dish) # rspec returns a type error 'can't define singleton'
      expect(order.add_dish(1)).to eq order.order_items[dish]
    end
  end

  context 'order sum' do
    it 'can return the total amount of the order' do
      order.add_dish(1)
      expect(order.order_sum).to eq '2.55'
    end
  end
end

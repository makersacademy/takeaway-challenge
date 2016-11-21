require 'order'

describe Order do

  subject(:order) {described_class.new(Menu)}
  let (:menu) { double :menu}

  context "#ordering" do
    it 'order is initialized with an empty list for order items' do
      expect(order.order_items).to eq []
    end

    it 'order is initialized with a 0 amount of order_sum' do
      expect(order.order_sum).to eq 0
    end

    xit 'can read the items from the menu' do
      expect(order.read_menu).to eq menu.display
    end

    xit 'can add items from the menu to the order' do
      food = {num: 1, dish: "Chicken Soup", price: 3.45}
      allow(:menu).to receive(:menu_items).with(food)
      expect(order.add_to_order(1)).to eq order.order_items[food]
    end

    context 'order sum' do
      it 'can return the sum of the order' do
        order.add_to_order(1)
        expect(order.order_sum).to eq 3.45
      end

      it 'checks if the final price is correct' do
        order.add_to_order(2)
        order.order_sum
        expect(order.is_correct_amount?(8.99)).to eq true
      end
    end
  end
end

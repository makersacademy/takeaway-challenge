require 'order'

describe Order do
    let(:menu){double :menu, display_menu: {"Fried Rice" => 5.99,
    "Chicken Chow Mein" => 7.99, "Cheeseburger" => 6.99, "Pizza" => 8}}
    subject(:order){described_class.new menu}
    before (:each) do
      order.order_food("Fried Rice", 2)
      order.order_food("Cheeseburger", 1)
    end
    it 'takes an order' do
      food_order = {"Fried Rice" => 2, "Cheeseburger" => 1}
      expect(order.order).to eq food_order
    end

    it 'summarizes order' do
      summary = "Fried Rice x 2 = $#{5.99 * 2}, Cheeseburger x 1 = $6.99"
      expect(order.order_summary).to eq summary
    end

    it 'totals the order' do
      expect(order.total).to eq (5.99 * 2) + 6.99
    end
end

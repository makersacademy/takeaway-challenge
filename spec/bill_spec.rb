require 'bill'

describe Bill do

  context 'is passed an order' do
    let(:order_item_one) {double :order_item_one, name: "Chicken Curry", quantity: 5}
    let(:order_item_two) {double :order_item_two, name: "Fried Rice", quantity: 3}
    let(:order_item_three) {double :order_item_three, name: "Prawn Crackers", quantity: 3}

    let(:menu_item_one) {double :menu_item_one, name: "Chicken Curry", price: 5}
    let(:menu_item_two) {double :menu_item_two, name: "Fried Rice", price: 3}
    let(:menu_item_three) {double :menu_item_three, name: "Prawn Crackers", price: 3}

    let(:menu) {double :menu, items: [menu_item_one, menu_item_two, menu_item_three]}
    let(:order) {double :order, items: [order_item_one, order_item_two, order_item_three]}
    bill_total = 43

    subject(:bill) {described_class.new(menu)}

    it 'calculates the bill correctly' do
      allow(menu_item_one).to receive(:price) {5}
      expect(bill.total(order)).to eq bill_total
    end

  end

end

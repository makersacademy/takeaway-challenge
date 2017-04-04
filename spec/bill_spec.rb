require 'bill'

describe Bill do

  context 'is passed an order' do
    let(:order_item_one) {double :order_item_one, name: "Pepperoni", quantity: 5}
    let(:order_item_two) {double :order_item_two, name: "Margherita", quantity: 3}
    let(:order_item_three) {double :order_item_three, name: "Ham & Pineapple", quantity: 3}

    let(:menu_item_one) {double :menu_item_one, name: "Pepperoni", price: 5}
    let(:menu_item_two) {double :menu_item_two, name: "Margherita", price: 3}
    let(:menu_item_three) {double :menu_item_three, name: "Ham & Pineapple", price: 3}

    let(:menu) {double :menu, items: [menu_item_one, menu_item_two, menu_item_three]}
    let(:order) {double :order, items: [order_item_one, order_item_two, order_item_three]}
    bill_total = 43

    subject(:bill) {described_class.new(menu)}

    describe '.total_bill' do
      it 'calculates the bill correctly' do
        allow(menu_item_one).to receive(:price) {5}
        expect(bill.total_bill(order)).to eq bill_total
      end
    end
  end

end

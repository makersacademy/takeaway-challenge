require 'order'
describe Order do
   subject(:new_order) {Order.new}
   let(:oyster) {double :oyster}
   let(:qty) {double :qty}
   let(:menu) do {"diet coke"=>0.99, "foie gras"=>18.50,
    "caviar"=>99.00, "oyster"=>0.99, "champagne"=>50.00} end
   #let(:pizza) {double (menu: "pizza", price: 9.50)}
  context "Method check" do
    it {is_expected.to respond_to :add_item_qty}
    it {is_expected.to respond_to :order}
    it {is_expected.to respond_to :basket_summary}
    it {is_expected.to respond_to :view_menu}
  end
    it 'initializes with an empty order' do
      expect(new_order.order).to eq []
    end
    describe "#add_item_qty" do
     it "adds an item to the order" do
      allow(new_order).to receive(:check_on_menu?).with(oyster).and_return true
      new_order.add_item_qty(oyster, qty)
      expect(new_order.order).to include [oyster, qty, nil]
     end
    end
     describe '#basket_summary' do
      it'returns a summary of the basket' do
        #allow(new_order).to receive(:order).and_return ["diet coke", 5, 0.99]
        new_order.add_item_qty("diet coke", 1)
        expect(new_order.basket_summary).to eq "diet coke x1 = 0.99"
      end
      it 'raises an error if the basket is empty' do
        expect{new_order.basket_summary}.to raise_error "basket is empty"
      end
     end
    describe '#view_menu' do
      it 'views the menu' do
        expect(new_order.view_menu).to eq menu
      end
    end

    describe '#remove_item' do
      it 'removes an item from the order' do
        new_order.add_item_qty("diet coke", 1)
        new_order.add_item_qty("oyster", 1)
        new_order.remove_item(1)
        expect(new_order.order).to eq [["diet coke",1 ,0.99]]
      end
    end

    describe '#checkout' do
      it 'checks out if the order totals match up' do
        new_order.add_item_qty("diet coke", 1)
        new_order.add_item_qty("diet coke", 1)
        new_order.checkout_order(1.98)
        expect(new_order.checked_out).to be_truthy
      end
      it 'does not checkout if the totals do not match' do
        new_order.add_item_qty("diet coke", 1)
        new_order.add_item_qty("diet coke", 1)
        new_order.checkout_order(1.99)
        expect(new_order.checked_out).to be_falsey
      end
    end
end


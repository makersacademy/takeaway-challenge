require 'order'
 describe Order do
   subject(:new_order) {Order.new}
   let(:oyster) {double :oyster}
   let(:menu_list) {{"diet coke"=>0.99, "foie gras"=>18.5, "caviar"=>99.0, "oyster"=>0.99, "champagne"=>50.0}}
  context "Method check" do
    it {is_expected.to respond_to :add_item_qty}
    it {is_expected.to respond_to :view_menu}
    it {is_expected.to respond_to :get_total}
    it {is_expected.to respond_to :basket_summary}
    it {is_expected.to respond_to :checkout}

  end
   describe "#Order" do
     it "allows me to place an order from the menu" do
      new_order.add_item_qty("diet coke",1)
      expect(new_order.order).to eq [["diet coke", 0.99, 1]]
     end
     it 'only accepts items on the menu' do
      new_order.add_item_qty("coke",1)
      expect(new_order.order).to eq []
     end
     it 'raises an error if item is not on the menu' do
      expect{ new_order.add_item_qty("coke",3) }.to raise_error "item not available"

   end
   end
   describe '#view_menu' do
    it 'returns the menu' do
      expect(new_order.view_menu).to eq menu_list
   end
   describe '#get_total' do
    it 'sums up the order and returns a total' do
      new_order.add_item_qty("diet coke",1)
      new_order.add_item_qty("champagne",2)
      new_order.add_item_qty("oyster",10)
      new_order.add_item_qty("caviar",1)
      expect(new_order.get_total).to eq 209.89
    end
   end
    describe '#basket_summary' do
      it 'raises and error if the basket is empty' do

        expect{ new_order.basket_summary}.to raise_error "basket is empty"
      end
    end
    describe '#checkout' do
      it 'sends the order to the restarant class' do

      end
    end
 end
end
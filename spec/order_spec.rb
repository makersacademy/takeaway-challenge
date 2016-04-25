require 'order'
 describe Order do
   subject(:new_order) {Order.new}
   let(:oyster) {double :oyster}
   let(:qty) {double :qty}
   let(:menu) {{"diet coke"=>0.99, "foie gras"=>18.50, "caviar"=>99.00, "oyster"=>0.99, "champagne"=>50.00}}
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
      # describe '#get_price' do
      #   it 'returns the price of the item from the menu hash' do
      #     expect(new_order.get_price("diet coke")).to eq 0.99
      #   end
      # end
      # describe '#order_total' do
      #   it 'returns the total of the basket' do
      #     new_order.add_item_qty("diet coke", 1)
      #     new_order.add_item_qty("diet coke", 1)
      #     new_order.add_item_qty("diet coke", 1)
      #     expect(new_order.order_total).to eq 2.97
      #   end
      # end
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
          expect(new_order.checkout).to be_truthy
        end
        it 'does not checkout if the totals do not match' do
          new_order.add_item_qty("diet coke", 1)
          new_order.add_item_qty("diet coke", 1)
          new_order.checkout_order(1.99)
          expect(new_order.checkout).to be_falsey
        end

      end


    #   it "gives the total for the current order" do
    #     allow(new_order).to receive(:order).and_return [oyster, 10.99, 2]

    #     expect(new_order.order_total).to eq 20
    #   end
    # end
   #   it 'only accepts items on the menu' do
   #    new_order.add_item_qty("coke",1)
   #    expect(new_order.order).to eq []
   #   end
   #   it 'raises an error if item is not on the menu' do
   #    expect{ new_order.add_item_qty("coke",3) }.to raise_error "item not available"

   # end
   # end
   # describe '#view_menu' do
   #  it 'returns the menu' do
   #    expect(new_order.view_menu).to eq menu_list
   # end
   # describe '#get_total' do
   #  it 'sums up the order and returns a total' do
   #    new_order.add_item_qty("diet coke",1)
   #    new_order.add_item_qty("champagne",2)
   #    new_order.add_item_qty("oyster",10)
   #    new_order.add_item_qty("caviar",1)
   #    expect(new_order.get_total).to eq 209.89
   #  end
   # end
   #  describe '#basket_summary' do
   #    it 'raises and error if the basket is empty' do

   #      expect{ new_order.basket_summary}.to raise_error "basket is empty"
   #    end
   #  end
   #  describe '#checkout' do
   #    it 'sends the order to the restarant class' do

   #    end
   #  end
 end

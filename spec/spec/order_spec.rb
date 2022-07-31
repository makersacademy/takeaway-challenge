require 'order'

describe Order do

  describe '#add_item' do
    context '1 item in the order' do
      it 'adds an item to be printed later' do
        item_dbl = double("Burger", :Burger => "£4")
        order = Order.new
        order.add_item(item_dbl)
        expect { { order.print_order =>to {('{:Burger => "£4"}')}.to_stdout } }
      end
    end
  end

  describe '#remove_item' do
    context 'removes the item from the order' do

      it 'should delete the specified item' do
        current_order_dbl = double("current_order", :Burger => "£4", :Lobster => "£15")
        item_dbl = double("Burger", :Burger => "£4")
        order = Order.new
        order.remove_item(item_dbl)
        expect { { order.print_order =>to { ('{:Lobster => £15}') }.to_stdout } }
      end
    end
  end



  describe '#check_out' do
    context 'sums up the total price of the order' do
      let(:burger) { double("burger", :Burger => "£4") }
      let(:lobster) { double("lobster", :Lobster => "£15") }
      order = Order.new
      order.add(burger)
      order.add(lobster)
      specify { expect { order.check_out }.to output("You have ordered 2 dishes at £19.").to_stdout }
    end
  end

end

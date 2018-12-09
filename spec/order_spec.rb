  require 'order'

RSpec.describe Order do 
  let(:order){ Order.new }
  let(:dishes){[
    { name: "pizza", price: 10.50 }, 
    { name: "pasta", price: 9.45 },
    { name: "calzone", price: 8.65 },
    { name: "calamari", price: 5.65 },
    { name: "lasagna", price: 10.65 },
    { name: "garlic bread", price: 4.65 }
  ]}

  describe '#initalize' do
    it 'creates an empty order list'do
        expect(order.items_ordered).to be_empty
    end
  end
  describe '#print_menu'do
    it 'shows user the available menu' do
      expect(order.print_menu).to eq(dishes)
    end
  end
  describe '#take_order' do 
    it 'takes a dish' do 
      expect(order).to respond_to(:take_order).with(1)
    end 
    it 'adds the item to the order_list' do
      item = "pizza"
      expect{ order.take_order(item) }.to change(order.items_ordered, :count).by(1)
      expect(order.take_order(item)).to include(item)
    end

      # it 'fail if dish not on the menu' do
      #   order = Order.new
      #   item = "bananas"
      #   thing = order.take_order(item)
      #   expect{ thing }.to raise_error "dish not on the menu"
      # end 
    end
    describe '#calculate_total' do
      
    context 'adds to order before calculation' do 
      order = Order.new
      order.take_order("pizza")
      order.take_order("pasta")
      
      it 'returns total of order' do
        expect(order.calculate_total).to eq 19.95
      end
      
    describe '#print_basket' do
      it 'returns the items ordered and total' do 
        expect(order.print_basket).to eq("You have ordered pizza, pasta and the total is 19.95")
      end 

    describe '#complete_order' do
          it 'will send a text' do 
            expect(order.complete_order).to eq "Text sent"
          end 
        end
      end
    end
  end
end



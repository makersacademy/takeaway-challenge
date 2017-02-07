require './lib/menu'
require './lib/items_selection'
require './lib/order'


  describe Select_items do

        it "fills array with added menu choice" do
          choice = Select_items.new
          choice.items << {id: 2, quantity: 4}
          expect(choice.items.length).to eq(1)
        end
      end

  describe Order do
    subject(:order) {described_class.new}
    before {choice = Select_items.new
            choice.items << {id: 2, q: 1}
            choice.items << {id: 1, q: 1}
            choice.items << {id: 4, q: 1}
            }
        it 'can make a new order from items' do
          expect(order).to contain_exactly([{id:2,q:1},{id:1, q:1},{id:4,q:1}])
        end

        it 'lists items on rows with id, description, quantity and price' do
          expect(order_check).to include("2.Mixed bean chilli with wedges")
        end

        it 'has a total which matches the sum of various dishes in order' do
          expect(order.total).to eq(12.67)

        end

        it ' has a name and mobile_num' do
          expect(order.name).to eq("Smith")
          expect(order.number).to start_with(+44)
        end
    end

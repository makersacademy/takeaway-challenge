require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#add_food_item' do
    let(:order_item) { double(:order_item,
                          description: 'a food item',
                          quantity: 1,
                          unit_price: 10) }

    context 'first food item of this type' do
      # it 'ordered quantity of this food item changes by expected amount' do
      #   expect { order.add_food_item(order_item.description,
      #                               order_item.quantity,
      #                               order_item.unit_price) }
      #     .to change { order.order_items[order_item.description].quantity }
      #           .by(order_item.quantity)
      # end

      # it 'value of the order changes by the expected amount' do
      #   expect { order.add_food_item(order_item.description) }
      #     .to change { order.value }.by(order_item.value)
      # end

    end

  end


end

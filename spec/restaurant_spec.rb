require 'restaurant'

describe Restaurant do
  it { expect(subject).to respond_to :show_menu }
  it { expect(subject).to respond_to :take_an_order }
  it { expect(subject).to respond_to :receive_money }

  context 'when takes an order' do
    let(:menu) { double :menu }
    let(:pizza_dish) { double :dish }
    let(:paste_dish) { double :dish }
    before {
      allow(pizza_dish).to receive(:name).and_return('Pepperoni Feast')
      allow(pizza_dish).to receive(:price).and_return(10.00)
      allow(paste_dish).to receive(:name).and_return('Paste with octopus')
      allow(paste_dish).to receive(:price).and_return(7.90)
      allow(menu).to receive(:menu).and_return({pizza: [pizza_dish], paste: [paste_dish]})
    }

    context 'when creates valid order' do
      let(:valid_order_input) {
        ["pizza\n",
          "Pepperoni Feast\n",
          "1\n",
          "yes\n",
          "paste\n",
          "Paste with octopus\n",
          "2\n",
          "no\n",
          "yes\n"]
        }

        before {
          set_user_input
        }

        it 'returns order' do
          restaurant = Restaurant.new(menu)
          order = restaurant.take_an_order
          dish_orders = order.dish_orders
          expect(dish_orders[0].dish).to eq(pizza_dish)
          expect(dish_orders[0].count).to eq(1)
          expect(dish_orders[1].dish).to eq(paste_dish)
          expect(dish_orders[1].count).to eq(2)
        end
      end
    end

    def set_user_input
      allow_any_instance_of(Object)
      .to receive(:gets).and_return(*valid_order_input)
    end
  end

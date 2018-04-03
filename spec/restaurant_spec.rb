require 'restaurant'

describe Restaurant do
  ERROR_MESSAGES = {
    category_does_not_exist: 'Sorry, the caregory you are trying to choose does not exist',
    dish_does_not_exist: 'Sorry, the dish you are trying to choose does not exist',
    invalid_dish_count: 'Sorry, dish count can be 1 or more'
  }.freeze

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
      allow(menu).to receive(:menu).and_return({ pizza: [pizza_dish], paste: [paste_dish] })
    }

    context 'when creates a valid order' do
      context 'when an order is verified' do
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
          set_valid_user_input
        }

        it 'returns an order' do
          restaurant = Restaurant.new(menu)
          order = restaurant.take_an_order
          dish_orders = order.dish_orders
          expect(dish_orders[0].dish).to eq(pizza_dish)
          expect(dish_orders[0].count).to eq(1)
          expect(dish_orders[1].dish).to eq(paste_dish)
          expect(dish_orders[1].count).to eq(2)
        end
      end

      context 'when order is not verified' do
        let(:valid_order_input) {
          ["pizza\n",
            "Pepperoni Feast\n",
            "1\n",
            "yes\n",
            "paste\n",
            "Paste with octopus\n",
            "2\n",
            "no\n",
            "no\n"]
        }

        before {
          set_valid_user_input
        }

        it 'does not return an order' do
          restaurant = Restaurant.new(menu)
          order = restaurant.take_an_order
          expect(order).to be_nil
        end
      end
    end

    context 'when creates an invalid order' do
      context 'when categori is invalid' do
        let(:invalid_order_input) {
          ["sushi\n",
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
          set_invalid_user_input
        }

        it 'raises an error' do
          restaurant = Restaurant.new(menu)
          expect { restaurant.take_an_order }.to raise_error(ERROR_MESSAGES[:category_does_not_exist])
        end
      end

      context 'when dish name is invalid' do
        let(:invalid_order_input) {
          ["pizza\n",
            "California\n",
            "1\n",
            "yes\n",
            "paste\n",
            "Paste with octopus\n",
            "2\n",
            "no\n",
            "yes\n"]
        }

        before {
          set_invalid_user_input
        }

        it 'raises an error' do
          restaurant = Restaurant.new(menu)
          expect { restaurant.take_an_order }.to raise_error(ERROR_MESSAGES[:dish_does_not_exist])
        end
      end

      context 'when dish count is invalid' do
        let(:invalid_order_input) {
          ["pizza\n",
            "Pepperoni Feast\n",
            "0\n",
            "yes\n",
            "paste\n",
            "Paste with octopus\n",
            "2\n",
            "no\n",
            "yes\n"]
        }

        before {
          set_invalid_user_input
        }

        it 'raises an error' do
          restaurant = Restaurant.new(menu)
          expect { restaurant.take_an_order }.to raise_error(ERROR_MESSAGES[:invalid_dish_count])
        end
      end

        context 'when user answer difer from (yes/no)' do
          let(:invalid_order_input) {
            ["pizza\n",
              "Pepperoni Feast\n",
              "1\n",
              "yes\n",
              "paste\n",
              "Paste with octopus\n",
              "2\n",
              "foo\n",
              "no\n",
              "yes\n"]
          }

          before {
            set_invalid_user_input
          }

          it 'asks again for input and returns order' do
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
    end

    def set_valid_user_input
      allow_any_instance_of(Object)
      .to receive(:gets).and_return(*valid_order_input)
    end

    def set_invalid_user_input
      allow_any_instance_of(Object)
      .to receive(:gets).and_return(*invalid_order_input)
    end
  end

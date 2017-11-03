require 'order'

describe Order do

  let(:menu) { double('menu', send_dish: dish, send_dish_price: 10, in_menu?: true) }
  let(:dish) { double('dish', description: 'galinhas', price: 10) }

  subject(:order) { Order.new(menu) }
  subject(:order_with_dish) { Order.new(menu) }

  before do
    order_with_dish.add_dish(dish)
  end

  context 'Initialization' do

    describe 'Sets instance variables' do
      it 'initializes an empty order array' do
        expect(order.order).to eq []
      end

      it 'initializes total with a value of 0' do
        expect(order.total).to eq 0
      end

      it 'initializes status as :open' do
        expect(order.status).to eq :open
      end
    end

  end

  context 'Add/Remove methods' do

    describe 'adding dish to order' do
      before do
        order.add_dish(dish)
      end

      it 'adds dish to order array' do
        expect(order.order).to include dish
      end

      it 'adds dish price to total' do
        expect(order.total).to eq 10
      end

    end

    describe 'removing dish from order' do
      before do
        order_with_dish.remove_dish(dish)
      end

      it 'raises an error when asked to remove a dish not in order' do
        allow(order.menu).to receive(:in_menu?).and_return(false)
        expect { order.add_dish(dish) }.to raise_error('Invalid dish number')
      end

      it 'removes dish from order array' do
        expect(order_with_dish.order).to_not include dish
      end

      it 'subtracts dish price from total' do
        expect(order.total).to eq 0
      end

      it 'raises an error when asked to remove a dish not in order' do
        allow(order.order).to receive(:include?).and_return(false)
        expect { order.remove_dish(dish) }.to raise_error('Dish not in order')
      end

    end

  end

  context 'printing the order' do
    it 'correctly prints order' do
      2.times { order.add_dish(dish) }
      message = ["1. galinhas - £10\n"]
      message << "2. galinhas - £10\n"
      message << "Order is open\n"
      message << "Total: £20\n"
      expect { order.show }.to output(message.join).to_stdout
    end
  end

end

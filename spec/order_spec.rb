require 'order'


describe Order do


  subject(:order) { Order.new }
  subject(:order_with_dish) { Order.new }

  let(:dish) { double('dish') }

  before do
    allow(dish).to receive(:num).and_return(1)
    allow(dish).to receive(:description).and_return("galinhas")
    allow(dish).to receive(:price).and_return(10)
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

      it 'removes dish from order array' do
        expect(order_with_dish.order).to_not include dish
      end

      it 'subtracts dish price from total' do
        expect(order.total).to eq 0
      end

    end

  end


  context 'printing order' do
    it 'correctly prints order' do
      2.times { order.add_dish(dish) }
      message_1 = "1. galinhas - £10\n"
      message_2 = "2. galinhas - £10\n"
      message_3 = "Order is open\n"
      message_4 = "Total: £20\n"
      message = message_1 + message_2 + message_3 + message_4
      expect { order.show }.to output(message).to_stdout
    end
  end

end
require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish_name) {double('a name of dish')}
  let(:price) {double('a price of dish') }
  let(:amount) {double('number od dishes')}

  context "when created" do
    it "has an empty menu" do
      expect(order.list_of_items).to eq []
    end
  end

  context "oder has a dish" do
    before(:each){order.add_items(dish_name, price, amount)}
    describe '#add_items' do
      it 'adds items to list of items' do
        expect(order.list_of_items).to eq [{name: dish_name, price: price, amount: amount}]
      end
    end
    describe '#add_items' do
      it 'adds items to list of items' do
        expect(order.list_of_items).to eq [{name: dish_name, price: price, amount: amount}]
      end
    end
  end
    describe '#order_info' do
      it 'shows the final order' do
        order.add_items("chicken", 5, 5)
        expect{order.order_info}.to output("Final price: 25\nFinal number of dishes 5\n").to_stdout
      end
    end
    describe '#send_order' do
      it 'raises error when mismatch' do
        order.add_items(dish_name, 2, 2)
        expect { order.send_order }.to raise_error 'The amount of dishes does not match your order'
      end
      it 'creates new message when no mismatch' do
        expect(order.send_order).to be_instance_of(Message)
      end
    end
end

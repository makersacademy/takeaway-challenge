require 'order.rb'

describe Order do
    let(:order) { Order.new }
    let(:menu) { Menu.new }

    it { is_expected.to respond_to :order_list }
    it { is_expected.to respond_to :basket }
    it { is_expected.to respond_to :add}

    describe '#basket' do
        it 'prints the order' do
            expect(order.basket).to eq order.order_list
        end
    end

    describe '#add' do
        it 'adds items to the order list' do
            order.add('chips', 2)
            expect(order.order_list).to include('chips' => 2)
        end
    end

    describe '#total_amount' do
        it 'sums up the total amount of the order' do
            order.add('chips', 2)
            order.add('pizza', 1)
            expect(order.total_amount(menu)).to eq 14
        end
    end
end
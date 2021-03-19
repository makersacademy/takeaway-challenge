require 'takeaway.rb'
require 'menu.rb'

describe Takeaway do
    let(:takeaway) { Takeaway.new }
    let(:menu) { Menu.new }
    let(:order) {Order.new}

    it { is_expected.to respond_to :menu }

    describe '#read_menu' do
        it { is_expected.to respond_to :read_menu }

        it 'reads the menu' do
            takeaway.read_menu
            expect(takeaway.read_menu).to eq menu.printed_menu
        end
    end 

    it { is_expected.to respond_to :add_to_order }

    describe '#add_to_order' do

        it 'checks if an item exists on the menu' do
            expect { takeaway.add_to_order('banana', 3) }.to raise_error 'Sorry, this item is not on the menu.'
        end

        it 'starts a new order if there is no order already' do
            takeaway.add_to_order('chips', 1)
            expect(takeaway.order).not_to be nil
        end
    end

    it { is_expected.to respond_to :order_started? }

    describe '#order_started?' do
        it 'returns false if no order has started' do
            expect(takeaway.order_started?).to be false
        end

        it 'returns true if order has started' do
            takeaway.add_to_order('chips', 1)
            expect(takeaway.order_started?).to be true
        end
    end

    describe '#checkout' do
        it 'checks if the total amount is correct' do
            takeaway.add_to_order('chips', 5)
            allow(takeaway.order).to receive(:total_amount) { 1 }
            expect(takeaway.correct_amount?).to be false
        end

        
    end
end
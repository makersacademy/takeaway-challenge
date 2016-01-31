require 'order'

describe 'Order' do

  subject(:order) { Order.new }
  let(:menu) { double :menu }
  let(:messager) { double :messager }

  describe '#initialize' do
    it 'should have an empty order list' do
      expect(order.list).to be_empty
    end

    it 'should have a menu' do
      expect(order.menu).not_to be(nil)
    end

  end

  context 'customer can see menu and place order' do

    describe '#read_menu' do
      it 'displays the menu' do
        expect{order.read_menu}.to output.to_stdout
      end
    end

    describe '#choose' do
      it 'allows customer to choose items and add to list' do
         order.choose("Margherita")
         expect(order.list).to include("Margherita" => 6)
       end
    end

    before do
      order.choose("Margherita")
      order.total
    end

    describe '#total' do
      it 'calculates the total cost' do
        expect(order.total_cost).to eq 6
      end
    end

    describe '#place' do
      it 'confirms the order and delivery time' do
        expect(order.message).to eq @message
      end
    end

    describe '#send_message' do

      it 'sends a text message to customer' do
        allow(order).to receive(:send_message)
        expect(order).to receive(:send_message)
        order.send_message
      end
    end

  end

end

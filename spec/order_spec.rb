require 'order'

describe Order do
    subject(:order) {described_class.new(Menu)}
    let(:menu) { double :menu }
    let(:sms) {double :sms, message: "Thank you, your order is on its way" }

      it 'should test that a new menu is returned when see menu is called' do
        expect(order.view_menu).to be_kind_of Menu
      end

    context "orders and prices" do

      before do
        order.view_menu
      end

      it 'should test that ordering food returns food ordered' do
        expect(order.order_food(1,1)).to include {order1}
      end

      it 'should test that all items and prices ordered are returned' do
        expect(order.display_order).to include {users_order}
      end

      it 'should test that the calculate price returns the total of the bill' do
        order.order_food(0,1)
        order.order_food(2,3)
        order.order_food(6,5)
        expect(order.calculate_price).to eq "The total cost is £53"
      end

    describe '#send sms' do
      it 'should test that an sms is sent' do
        expect(order).to receive(:send_message).with("Thank you, your order is on its way")
        order.send_message("Thank you, your order is on its way")
      end
    end

      context 'Raise error' do

        it 'should raise an error if order has not been calculated' do
          order.view_menu
          expect{ order.send_sms("Your order has been dispatched") }.to raise_error "Cannot send sms: Amount has not yet been calculated"
        end
      end
    end
end

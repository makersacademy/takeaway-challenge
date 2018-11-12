require 'order'
require 'menu'

describe Order do

let(:order) { described_class.new(menu) }
let(:menu) { double(:menu, selected_items: [7, 7]) }
let(:test_order) { double(:order, selected_order: [7, 7], total_price: 12) }

   describe 'total' do
     it "Totals current order" do
       expect(order).to receive(:total).and_return 14
       order.total(menu)
       end
     end

    describe 'confirm_total' do
      it "Error if nothing added to order" do
        expect {order.confirm_total}.to raise_error 'There are no items in your order!'
      end

      it "Error if order total incorrect" do
        expect {test_order.confirm_total}.to raise_error 'There was a problem calculating your order.'
      end
  end
end

require 'order'
require 'text'
require 'menu'

describe 'feature tests' do

    let(:menu) {Menu.new}
    let(:order) {Order.new}

    it 'allows customers to view the menu' do
        expect(order.show_menu).to eq menu.view_menu
    end
    
    it 'allows customer to order multiple dishes' do
        order_hash = {:Coke => 3, :Special_Fried_Rice => 3}
        order.order_selection(:Coke, 3)
        order.order_selection(:Special_Fried_Rice, 3)
        expect(order.check_order).to eq order_hash
    end
    
    it 'allows customer to view the total bill' do
        order.order_selection(:Coke, 3)
        order.order_selection(:Special_Fried_Rice, 3)
        expect(order.show_bill).to eq "£10.50"
    end
    
    it 'allows customer to view individual totals for dishes' do
        order.order_selection(:Coke, 3)
        order.order_selection(:Special_Fried_Rice, 3)
        expect(order.order_summary).to eq "Coke x 3 = £3.00, Special_Fried_Rice x 3 = £7.50"
    end
end

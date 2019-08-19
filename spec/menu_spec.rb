require 'menu'

describe Menu do

    it 'can print a list of available items' do
    expect{subject.print_menu}.to output("1. Chips - £40
2. Fries - £45
3. Wedges - £43
4. Potato Waffles - £100
5. Croquettes - £100
6. Baked Potato - £600
7. Taytos Crisps (Ready Salted) - £25
8. Smash Ice Cream - £100
9. Poitin (100ml) - £1\n").to_stdout
    end
end

 describe Order do

    menu = Menu.new
    order = Order.new(menu)

     it 'allows a customer to select a single menu item' do
        order.select_item(2, 5)
        expect(order.order_hash).to eq({"Fries" => 5})
     end

     # 'allows a customer to select multiple menu items'

end

describe Summary do 

    menu = Menu.new
    order = Order.new(menu)
    summary = Summary.new(menu, order)

     it 'allows a customer to view a summary of their order' do
        # mock_order = double(:mock_order) 
        # allow(mock_order).to recieve(:order_hash).and_return({"Potato A" => 2, "Potato B" => 3})
        # summary.new(mock_order)
        order.select_item(2, 2)
        order.select_item(3, 3)
        expect{summary.print_order}.to output("Fries x 2 - £90
Wedges x 3 - £129" + "\nTotal: £219\n").to_stdout

    end
end

#     # 'correctly calculates the total cost'?
#     # 'allows a customer to see a breakdown of their order alongside the total cost'

#  describe Checkout do

#     menu = Menu.new



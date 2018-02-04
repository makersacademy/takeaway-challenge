require "menu"

 describe Menu do

   let(:menu) {Menu.new(product_list)}

   let(:product_list) do
     { 1 => ["Beef burger", 10],
     2 => ["Cheese burger", 12] }
   end

   let(:product_1) {double("Beef burger", number: 1, name: "Beef burger", price: 10, quantity: 1)}
   let(:product_2) {double("Cheese burger", number: 2, name: "Cheese burger", price: 12, quantity: 1)}

   let(:printed_menu) do
     "Dish number: 1. Dish name: Beef burger. Price: £10\nDish number: 2. Dish name: Cheese burger. Price: £12\n"
   end

   it {is_expected.to respond_to(:print_menu) }

   it 'Prints the menu with prices' do
     #TODO This test is not independent
     menu.print_menu
     expect{ menu.print_menu }.to output(printed_menu).to_stdout
   end

 end

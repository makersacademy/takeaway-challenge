require "menu"

 describe Menu do

   let(:product_list) {FOOD_MENU = {
     1 => ["Beef burger", 10],
     2 => ["Cheese burger", 12],
     3 => ["Chicken burger", 9],
     4 => ["Fries", 4],
     5 => ["Strawberry shake", 5],
     6 => ["Banana shake", 5],
     7 => ["Oreo shake", 5]
   }}

   # let(:printed_menu) {
   #  "Beef burger: £10"
   #  "Cheese burger: £12"
   #  "Chicken burger: £9"
   #  "Fries: £4"
   #  "Strawberry shake: £5"
   #  "Banana shake: £5"
   #  "Oreo shake: £5"
   # }

   it {is_expected.to respond_to(:print_menu) }

   it 'Prints the menu with prices' do
     p subject.print_menu
     p printed_menu
     expect{ subject.print_menu }.to output(printed_menu).to_stdout
   end

   it 'Populates the menu with items from the product list' do

   end

 end

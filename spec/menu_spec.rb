require "menu"

 describe Menu do

   let(:printed_menu) {
    "Beef Burger: £10"
    "Cheese Burger: £12"
    "Chicken Burger: £9"
    "Fries: £4"
    "Strawberry Shake: £5"
    "Banana Shake: £5"
    "Oreo Shake: £5"
   }
   it {is_expected.to respond_to(:print_menu) }

   it 'Prints the menu with prices' do
     p subject.print_menu
     p printed_menu
     expect{ subject.print_menu }.to output(printed_menu).to_stdout
   end

 end

require "take_away"

 describe Takeaway do
   subject(:takeaway) { described_class.new(menu: menu) }

   let(:menu) { double(:menu, print: printed_menu) }
   let(:printed_menu) { "Fish: £3.50" }

   it "shows the menu with the dishes and prices" do
     expect(takeaway.print_menu).to eq(printed_menu)
   end
   
 end


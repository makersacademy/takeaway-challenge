require "menu"

 describe Menu do

   subject(:menu) { described_class.new(dishes) }

   let(:dishes) do
     {
       Fish: 9.99,
       Chips: 3.50
     }
   end

   it "has a list of dishes with prices" do
     expect(menu.dishes).to eq(dishes)
   end

   it "prints a list of dishes with prices" do
     printed_menu = "Fish £9.99, Chips £3.50"
     expect(menu.print).to eq(printed_menu)
   end
 end
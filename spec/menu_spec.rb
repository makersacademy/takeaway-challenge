require "menu"

 describe Menu do

   subject(:menu) { described_class.new(dishes) }

   let(:dishes) do
     {
       fish: 3.99,
       meat: 4.5
     }
   end

   it "has a list of dishes with prices" do
     expect(menu.dishes).to eq(dishes)
   end

   it "prints a list of dishes with prices" do
     printed_menu = "fish, 3.99, meat, 4.5"
     expect(menu.print).to eq(printed_menu)
   end
   it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:fish)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:beef)).to be false
  end
 end

  
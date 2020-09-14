require 'menu'

describe Menu do
 subject(:menu) { described_class.new(dishes) } #with the mnu object I will inject the foods(hash) inside the menu

 let(:dishes) do 
    { 
      fish: 5.00,
      beef: 6.00
    }
end

 it "has a list of dish with prices" do
    expect(menu.dishes).to eq(dishes)
 end

 it "prints a list of dishes with prices" do
  printed_menu = "fish £5.00, beef £6.00"
  expect(menu.print_out).to include(printed_menu)
 end

 it "tells if a dish is on the menu" do
   expect(menu.has_dish?(:fish)).to be true
 end

 it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:chicken)).to be false
 end

 it "calaculates a price" do
    expect(menu.price(:fish)).to eq(dishes[:fish])
 end

end

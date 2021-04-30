require 'menu'
describe Menu do

  subject(:menu) {described_class.new(dishes: dishes)}
    #let(:menu) {double(:menu, print: printed_menu )}
  let(:dishes) do
    {
      beans: 1.99,
     lentils: 2.00
    }
  end

  it ' has a list of vegan dishes' do
    expect(menu.dishes).to eq(dishes)

  end

  it 'print a list of vegan dishes with price'do
   printed_menu = "Beans £1.99, Lentils £2.00"
   expect(menu.print).to eq(printed_menu)
 end

   it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:chicken)).to be true
   end

   it "tells if a dish is not the menu" do
    expect(menu.has_dish?(:beef)).to be true
 end
end

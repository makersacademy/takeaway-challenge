require 'menu'
describe Menu do
 subject(:menu) { described_class.new(dishes) }

 let(:dishes) do
   {
     hot_dog: 2.95,
     veg_burger: 3.95
   }
end
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints the menu card' do
  printed_menu = "hot_dog £2.95, veg_burger £3.95"
    expect(menu.print).to eq(printed_menu)
  end

 end

require 'menu'


describe Menu do

subject(:menu) { described_class.new(dishes) }

let(:dishes) do
  {
    Burger: 3.50,
    Kebab: 2.99
  }
end


it 'shows the list of dishes with their prices' do
  expect(menu.dishes).to eq(dishes)
end

it "prints a list of dishes with prices" do
  printed_menu = "Burger £3.50, Kebab £2.99"
  expect(menu.print).to eq(printed_menu)
end
end

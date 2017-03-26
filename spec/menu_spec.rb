require 'menu'

describe Menu do
  subject(:menu) {described_class.new(dishes: dishes)}
  let(:dishes) do
    {
      Katsu_Chicken_Wrap: 4.50,
      Roast_and_Toast_Small_Box: 3.99,
      Roast_and_Toast_Big_Boy_Box: 4.99
    }
  end

  it 'has a list of dishes'do
    expect(menu.dishes).to eq dishes
  end

  it 'shows menu when #print_menu' do
    fake_menu = "Katsu Chicken Wrap - £4.50, Roast and Toast Small Box - £3.99, Roast and Toast Big Boy Box - £4.99"
    expect(menu.print_menu).to eq fake_menu
  end

  it {is_expected.to respond_to(menu.has_dish?).with(1).argument}
end

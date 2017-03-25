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

  it 'shows menu when #show_menu' do
    expect(menu.show_menu).to eq dishes
  end
end

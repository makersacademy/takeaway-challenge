require 'menu'
require 'takeaway'

describe Menu do
  subject(:menu) { described_class.new(dish_hash) }

  let(:dish_hash) do
    {
     pasta: 4.5,
     pizza: 5.0,
     veggy_wrap: 3.8,
     noodles: 4.5
     }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dish_hash)
  end

  describe '#printing_menu' do
    it 'prints the menu' do
      formatted_menu = "Pasta 4.5, Pizza 5.0, Veggy_wrap 3.8, Noodles 4.5"
      expect(menu.printing_menu).to eq(formatted_menu)
    end
  end

end

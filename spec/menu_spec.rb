require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  it 'has a list of dishes' do
    expect(menu.dishes).to be_an_instance_of(Hash)
  end

  describe '#print_menu' do
    it 'returns a formatted list of dishes' do
      expect(menu.print_menu)
        .to eq(["Large Fish Supper - 7.90", "Small Fish Supper - 5.50",
          "White Sausage - 2.30", "Mars Bar in Batter - 2.00"])
    end
  end
end

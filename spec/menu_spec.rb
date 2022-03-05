require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'can create a Menu' do
    expect(menu).to be_a_kind_of(Menu)
  end

  describe '#list_dishes' do
    it 'prints a list of dishes with prices' do
      expect { menu.list_dishes }.to output(<<-output
Olives £2.5
Pizza £10
Pasta £12
Risotto £18
Burger £13
Steak £20
Tiramisu £7.5
Panna cotta £6.5
output
      ).to_stdout
    end
  end

  describe '#check_availability' do
    it 'raises an error when checking for the wrong item' do
      expect { menu.check_availability('Tortilla') }.to raise_error 'Dish not available. Please make a new selection.'
    end
  end
end

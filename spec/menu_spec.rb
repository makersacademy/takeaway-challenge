require 'menu'

RSpec.describe Menu do
  let(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
        kenkey_and_shito: 4,
        banku_and_shrimp: 5
    }
  end

  describe '#menu' do
    it 'returns dishes' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#show_dish' do
    it 'shows a list of dishes' do
      print_dish = 'kenkey_and_shito £4, banku_and_shrimp £5'
      expect(menu.show_dish).to eq(print_dish)
    end
  end

end

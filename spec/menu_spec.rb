require 'menu'

describe Menu do
  subject(:menu) { described_class.new(meals) }
  let(:meals) { { 'salad' => 5.45, 'burger' => 7.99 } }

  it 'has a list of meals with their prices' do
    expect(menu.meals).to eq(meals)
  end

  describe '#display' do
    it 'displays a list of meals with their prices' do
      expect(menu.display).to eq('salad: 5.45, burger: 7.99')
    end
  end

end

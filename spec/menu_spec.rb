require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it 'has a default dishes list empty' do
    expect(menu.dishes).to be_empty
  end

  describe '#add_dish' do
    it 'add a dish with relative price to the list' do
      menu.add_dish('dish', 1)
      expect(menu.dishes).to include('dish' => 1)
    end

    it 'raise an error if the dish is already in the list' do
      msg = 'Dish already in the list!'
      menu.add_dish('dish', 1)
      expect { menu.add_dish('dish', 2) }.to raise_error msg
    end
  end

  context 'when dishes is not empty' do
    before do

    end
  end

end

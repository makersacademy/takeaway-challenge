require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:dish) { double('dish', name: 'Burger', price: 3) }

  it { is_expected.to respond_to(:add_dish) }

  it 'has an empty array for dishes' do
    expect(menu.dishes).to be_empty
  end

  # describe '#add_dish' do
  #   it 'adds a dish to the menu' do
  #     expect(menu.dishes).to include dish
  #   end
  # end
end

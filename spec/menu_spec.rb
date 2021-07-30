require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new(meals) }

  let(:meals) do { chicken: 5 } end

  it 'store a list of meals and prices' do 
    expect(menu.meals).to eq(meals)
  end

  it 'shows the menu as a list' do
    x = "chicken, £5"
    expect(menu.display_menu).to eq(x)
  end
end

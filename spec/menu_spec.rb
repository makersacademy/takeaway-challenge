require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:example_dish) {"Margarita Pizza"}

  it 'has no items when first initialized' do
    expect(menu.dishes).to be_empty
  end

  it 'responds to menu' do
    expect(menu).to respond_to(:add_dish)
  end

  it 'adds items & prices to dishes' do
    menu.add_dish(example_dish, 7)
    expect(menu.dishes).to eq [{example_dish => 7}]
  end

  it 'prints the menu' do
    menu.add_dish(example_dish, 7)
    expect(menu.print_menu).to eq "#{example_dish}: £7"

  end
end

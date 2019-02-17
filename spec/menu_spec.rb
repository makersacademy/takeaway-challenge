require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes)}
  # it's not a good to create the menu is the class itself, so here
  # we're injecting the dishes hash into the class object when it
  # is initialized.
  let(:dishes) { { chicken: 3.50, falafel: 4.50 } }

  it 'is created with a list of dishes and prices' do
    expect(subject.dishes).to eq(dishes)
  end

  it 'prints a list of dishes and prices' do
    printed_menu = "Chicken £3.50, Falafel £4.50"
    expect(subject.print_menu).to eq(printed_menu)
  end

  # it 'tells if a dish is on the menu' do
  #   expect(menu.has_dish?("Chicken")).to be true
  # end

end

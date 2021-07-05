require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { { chicken: 3.50, falafel: 4.50 } }

  describe '#intialize'
  it 'is created with a list of dishes and prices' do
    expect(subject.dishes).to eq(dishes)
  end

  describe '#print_menu'
  it 'prints a list of dishes and prices' do
    printed_menu = "Chicken £3.50, Falafel £4.50"
    expect(subject.print_menu).to eq(printed_menu)
  end

  # it 'tells if a dish is on the menu' do
  #   expect(menu.has_dish?("Chicken")).to be true
  # end

  describe '#price'
  it 'calculates a price' do
    expect(menu.price(:chicken)).to eq(dishes[:chicken])
  end

end

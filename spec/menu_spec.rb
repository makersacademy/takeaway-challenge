require 'menu'
require 'order'

describe Menu do
# dependence injection. Inject dishes hash to menu.
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      lasagne: 8.99,
      ratatouille: 9.99,
    }
  end

  it 'has a list dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Lasagne £8.99, Ratatouille £9.99"
    expect(menu.print).to eq(printed_menu)
  end

  it 'confirms if a dish is on the menu' do
    expect(menu.has_dish?(:lasagne)).to be true
  end

  it 'confirms if a dish is not on the menu' do
    expect(menu.has_dish?(:steak)).to be false
  end

  it 'calculates a price' do
    expect(menu.price(:lasagne)).to eq(dishes[:lasagne])
  end
end

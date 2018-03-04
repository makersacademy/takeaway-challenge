require 'menu'
describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      pizza: 4.50,
      pasta: 4.30,
      lasagne: 5.80
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Pizza £4.50, Pasta £4.30, Lasagne £5.80"
    expect(menu.print).to eq(printed_menu)
  end

end

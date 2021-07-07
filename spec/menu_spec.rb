require 'menu'
describe Menu do

  subject(:menu) {described_class.new(dishes)}

  let(:dishes)do
  {
    Fries:  6.75,
    Burger:  6.00
  }
  end

  it'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
    end
  it 'prints a list of dishes with prices' do
    printed_menu = "Fries £6.75,Burger £6.00"
    expect(menu.print).to eq(printed_menu)
  end
end

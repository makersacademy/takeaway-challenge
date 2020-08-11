require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
  { salad: 5.00, pizza: 8.00}
end 

  it 'has list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end
  it 'prints a list of dishes with prices' do
    printed_menu = 'Salad £5.00, Pizza £8.00'
    expect(menu.print).to eq(printed_menu)
    end 
end 
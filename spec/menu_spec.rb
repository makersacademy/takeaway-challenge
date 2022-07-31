require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new(dishes) }
  
  let(:dishes) do
    {
    karahi: 6,
    nan: 1
    }
  end  
  
  
  it 'has a list of dishes with the prices displayed' do
    expect(menu.dishes).to eq(dishes)
  end  
  
  it 'prints dishes with prices' do
    printed_menu = "Karahi £6, Nan £1"
    expect(menu.print).to eq(printed_menu)
  end  
  
end

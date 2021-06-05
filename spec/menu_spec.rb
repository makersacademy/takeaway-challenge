require 'menu' 

describe Menu do
  subject(:menu) { described_class.new(dishes) }
   let(:dishes) do 
    {
      feijoada: 6.50,
      coxinha:  2.50
    }
   end

  it 'has a list of dishes and their prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints out a list with dishes and prices' do
    printed_menu = "Feijoada £6.50, Coxinha £2.50"
    expect(menu.print).to eq(printed_menu)
  end
end

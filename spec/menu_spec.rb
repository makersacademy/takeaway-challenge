require 'menu' 

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do 
    {
      feijoada: 6.50,
      coxinha:  1.15
    }
   end

  it 'has a list of dishes and their prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints out a list with dishes and prices' do
    printed_menu = "Feijoada £6.50, Coxinha £1.15"
    expect(menu.print).to eq(printed_menu)
  end
  it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:feijoada)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:beef)).to be false
  end
  it "calculates a price" do
    expect(menu.price(:feijoada)).to eq(dishes[:feijoada])
  end
end

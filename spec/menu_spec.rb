require 'menu'

describe Menu do

subject(:menu) { described_class.new(dishes) }

let(:dishes) do
  {
    Samosa: 6.50,
    Naan: 2.50
  }
end

  it 'contains a hash of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end
  it 'outputs a list of dishes and prices' do
    printed_menu = "Samosa: 6.50, Naan: 2.50"
    expect(menu.print).to eq(printed_menu)
  end

  it "sums a price" do
    expect(menu.price(:samosa)).to eq(dishes[:samosa])
  end
end

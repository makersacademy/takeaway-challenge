require 'menu'

describe Menu do

  it 'returns a list of menu items' do
    expect(subject.print_menu).to(be_a(Hash))
  end

  it '#print_menu' do
    expect(subject.print_menu).to include("Rice")
  end

  it "#print_price" do
    expect(subject.print_price("Thai Green Curry")).to eq(8)
  end

end

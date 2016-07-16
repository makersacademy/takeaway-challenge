require 'menu'

describe Menu do
    let(:menu) { Menu.new }

  it 'has a list of dishes with pricing' do
    expect(menu.dishes).to be_a(Hash)
  end

  it "has 3 items on the menu" do
    expect(menu.dishes.length).to eq(3)
  end

end

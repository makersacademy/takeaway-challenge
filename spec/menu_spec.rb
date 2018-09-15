require 'menu'
describe Menu do
  let(:russian) { described_class.new }

  it "displays the menu" do
    expect(russian.menu).to eq([])
  end

  it "adds a dish" do
    expect(russian.add_dish("borscht", 5.99, 3)).to eq([{ dish: "borscht", price: 5.99, quantity: 3 }])
  end

end
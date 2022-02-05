require_relative '../lib/menu'

describe Menu do
  subject(:menu){ described_class.new }
  let(:dish){ double("dish", :name => "Pizza", :price => 10.0) }

  it "can add a dish" do
    expect(menu.add(dish)).to include(dish)
  end

  it "formats a single dish" do
    menu.add(dish)
    expect(menu.view).to eq "Pizza: £10.00"
  end

  it "formats multiple dishes" do
    4.times{menu.add(dish)}
    str = "Pizza: £10.00\nPizza: £10.00\nPizza: £10.00\nPizza: £10.00"
    expect(menu.view).to eq(str)
  end

end
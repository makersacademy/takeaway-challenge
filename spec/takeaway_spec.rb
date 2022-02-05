require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway){ described_class.new }
  let(:dish){ double("dish", :name => "Pizza", :price => 10.0)}

  it{ is_expected.to respond_to(:view_menu).with(1).argument }

  it "formats a single dish" do
    menu = [dish]
    expect(takeaway.view_menu(menu)).to eq "Pizza: £10.00"
  end

  it "formats multiple dishes" do
    menu = []
    4.times{menu << dish}
    str = "Pizza: £10.00\nPizza: £10.00\nPizza: £10.00\nPizza: £10.00"
    expect(takeaway.view_menu(menu)).to eq(str)
  end

end

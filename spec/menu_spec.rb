require 'menu'

describe Menu do
  subject (:menu) { described_class.new(dishes) }
  let(:dishes) { {Pasta: 7, Pizza: 9, Canlone: 9} }
  let(:printed_menu) {"Pasta - £7, Pizza - £9, Canlone - £9"}


  it "should initialize a menu with a list of dishes" do
    expect(menu.dishes).to eq(dishes)
  end

  it "should print menu" do
    expect(menu.print).to eq(printed_menu)
  end

  it "should print the price of the item" do
    expect(menu.price(:Pizza)).to eq dishes[:Pizza]
  end

end

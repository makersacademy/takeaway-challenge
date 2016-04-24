require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) { { arepa: 5.50, empanada: 2.50 } }

  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "displays a list of dishes with prices" do
    printed_menu = "Arepa £5.50, Empanada £2.50"
    expect(menu.display).to eq(printed_menu)
  end

  it "checks if the name of dish is on menu" do
    expect(menu.has_name?(:arepa)).to be true
  end

  it "checks if the name of dish is not on menu" do
    expect(menu.has_name?(:plantain)).to be false
  end

  it "calculates a price" do
    expect(menu.price(:arepa)).to eq(dishes[:arepa])
  end


end

require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes }
  let(:dishes) do {
    "Tacos" => 5,
    "Burrito" => 5,
    "Quesadilla" => 7,
    "Enchiladas" => 7
  }
  end

  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end
  
  
  it "prints a list of dishes and prices" do
    printed_menu = "Tacos: £5, Burrito: £5, Quesadilla: £7, Enchiladas: £7"
    expect(menu.print_menu).to eq(printed_menu)
  end
end

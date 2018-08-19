require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { { "pepperoni" => 7.50, "hawaiian" => 6.50, "vegetarian" => 5.50 } }

describe "#print_menu" do
  it "should print the menu" do
    expect(menu).to respond_to(:print_menu)
  end
  it "should print the menu" do
    expect(menu.dishes).to eq(dishes)
  end
  it "should print the menu" do
    printed_menu = "Pepperoni £7.50, Hawaiian £6.50, Vegetarian £5.50"
    expect(menu.print_menu).to eq(printed_menu)
  end


end

end

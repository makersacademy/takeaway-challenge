require 'menu'

describe Menu do
  subject(:menu) { described_class.new (dishes)}
  let(:dishes) {{Margherita: 7.95,
    Tropicana: 10.80,
    Fiorentina: 9.90}}

  it "returns all the available dishes" do
    expect(menu.dishes).to eq dishes
  end

  it "returns a printed list of the menu" do
    expect(menu.print_menu).to be_an_instance_of Array
  end

end

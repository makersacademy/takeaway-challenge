require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  let(:dishes) do
    {
      hotdog: 5.00,
      fries: 3.50
    }
  end

  it "can view the menu" do
    expect(menu.dishes).to eq (dishes)
  end

  it "shows the menu when called" do
    printed_menu = "Hotdog £5.00, Fries £3.50"
    expect(menu.print_menu).to eq(printed_menu)
  end

end

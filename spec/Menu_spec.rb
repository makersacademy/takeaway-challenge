require_relative '../lib/Menu'

describe Menu do

  subject(:menu) { Menu.new(dishes) }
  let(:dishes) do
    {
      wonton: 5.50,
      spring_roll: 5.50

    }
  end
  it "has a list of dishes with prices" do
    printed_menu = "Wonton £5, Spring Roll £5"
    expect(menu.dishes).to eq(printed_menu)
  end

end

require "menu"

describe Menu do

  let(:menu) { Menu.new(dishes) }

  let(:dishes) do
    {
      lasagna: 9.99,
      salad: 4.02
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end
end
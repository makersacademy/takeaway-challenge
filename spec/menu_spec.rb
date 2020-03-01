require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
    { margarita: 5.00, sandwich: 2.99 }
  end

  it "list of dishes and their prices" do
    expect(menu.dishes).to eq(dishes)
  end
end

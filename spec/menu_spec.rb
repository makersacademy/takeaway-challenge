require 'menu'



describe Menu do
  subject(:menu)  { described_class.new(dishes) }
  let(:dishes) do
    { Chicken_Tikka: 4.50, Rice: 1.00, Naan_Bread: 2.00 }
  end

  it "has a list of dishes with prices" do
  expect(menu.dishes).to eq dishes
  end

  it "prints a list of dishes and their prices" do
    dishes = "Chicken_Tikka £4.50, Rice £1.00, Naan_Bread £2.00"
    expect(menu.show).to eq dishes
  end
end
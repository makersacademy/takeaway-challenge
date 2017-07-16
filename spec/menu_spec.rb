require 'menu'

describe Menu do
  subject(:menu) { described_class.new (dishes)}
  let(:dishes) {{"Margherita": 7.95,
    "Tropicana": 10.80,
    "Fiorentina": 9.90,
    "Steak and Rocket": 14.95,
    "Penne Arrabiata": 7.95,
    "Salmon Penne":11.80}}
  let(:dish_name) { "Margherita" }
  let(:dish_price) { 7.95 }

  it "returns all the available dishes" do
    expect(menu.dishes).to eq dishes
  end
end

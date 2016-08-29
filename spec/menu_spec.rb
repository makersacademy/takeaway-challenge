require 'menu'

describe Menu do

  subject(:menu) {described_class.new}
  let(:dishes_stub) { {"Chow Mein" => 5.85, "Sweet & Sour Chicken" => 5.85, "Aromatic Duck" => 7.95, "Crispy Beef" => 5.95} }


  it "contains a list of dishes" do
    expect(menu.dishes).to eq dishes_stub
  end
end

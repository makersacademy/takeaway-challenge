require 'menu'
describe Menu do
  it "initializes a menu" do
    expect(subject.dishes).to eq ({"Chicken Wing" => 1.99, "Pizza" => 10.99, "Burger" => 4.99, "Soft Drink" => 1.49, "Ice Cream" => 2.99})
  end

  it "prints menu" do
    expect(subject.read_menu).to eq ({"Chicken Wing" => 1.99, "Pizza" => 10.99, "Burger" => 4.99, "Soft Drink" => 1.49, "Ice Cream" => 2.99})
  end
end

require 'list_of_dishes'

describe ListofDishes do
  it "prints the menu" do
    expect(subject.menu).to eq("Lassagna" => 9,
    "Ravioli" => 9,
    "Spaghetti Bolonese" => 9,
    "Macarones" => 9,
    "Penne" => 8,
    "Canneloni" => 8,
    "Margherita" => 9,
    "Four Cheeses" => 10,
    "Tuna & Onion" => 8,
    "Veggie Lover" => 9,
    "Salami" => 10,
    "Chicken with Tomato" => 10)
  end
end

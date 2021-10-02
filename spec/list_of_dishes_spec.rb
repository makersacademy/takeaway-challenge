require 'list_of_dishes'

describe ListofDishes do
  it "prints the menu" do
    expect(subject.print_menu).to eq("Lassagna" => 9,
    "Ravioli" => 9,
    "Spaghetti Bolonese" => 9,
    "Macarones" => 9,
    "Penne" => 8,
    "Canneloni" => 8,
    "Margherita" => 9,
    "4 Cheeses" => 10,
    "Tuna & Onion" => 8,
    "Veggie Lover" => 9,
    "Salami" => 10,
    "Chicken with Tomato" => 10)
    end


  it "takes user's order and returns it" do
    subject.order
    order = double
    order.stub(:gets).and_return("Lassagna")
    allow($stdin).to receive(:gets).and_return(order)
    # expect(order).to receive(:chomp).and_return()
    expect(subject.total_order.length).to eq(1)
  end
end

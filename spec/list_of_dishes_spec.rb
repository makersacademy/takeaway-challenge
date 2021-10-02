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


  let(subject.order).to receive(:order).and_return(2)

    it "takes customer order" do
      expect(subject).to eq(Choice)
    end

    it "populates total_order array with order" do
      list.list_of_dishes
      expect(@list_of_dishes.length).to eq(1)
    end
  end

require "food_list.rb"

describe FoodList do
  it "is an instance of the FoodList class" do
    expect(subject).to be_a(FoodList)
  end

  it "has a menu" do
    expect(subject.current_menu).to be_a(Hash)
  end

  it "has a menu that is populated by food and prices" do
    expect(subject.current_menu).to eq ({
      "Cheesey jalapeño bites" => 5.49,
      "Cheese and tomato pizza" => 11.99,
      "Dipping sauce" => 0.45,
      "Giant choc chip cookie" => 4.99,
      "Pepsi max" => 2.49})
  end

  it "should show the list of food and prices" do
    expected_menu_string = "Cheesey jalapeño bites          £5.49\n"+
    "Cheese and tomato pizza        £11.99\n"+
    "Dipping sauce                   £0.45\n"+
    "Giant choc chip cookie          £4.99\n"+
    "Pepsi max                       £2.49\n"
    expect { subject.print_menu }.to output(expected_menu_string).to_stdout
  end
end

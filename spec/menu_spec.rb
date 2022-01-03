require "menu"

describe Menu do

  it "starts with DEFAULT_DISHES stored" do
    expect(subject.dishes).to eq({
      "Beef Burger" => 6,
      "Chicken Burger" => 5,
      "Chips" => 2.50,
      "Soft Drink" => 1.50
    })
  end

  it "lists dishes in the menu and numbers them" do
    expect { subject.list }.to output { 
      "1- Beef Burger £6\n2- Chicken Burger £5\n3- Chips £2.50\n4- Soft Drink\n"
    }.to_stdout
  end
end

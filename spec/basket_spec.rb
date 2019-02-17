require 'basket'

describe Basket do

  let ( :your_basket ) { Basket.new }
  let ( :item_1 ) { { item: "1 - Kenjutsu: Chicken, Pepperoni, Green Chili", price: "10.99" } }
  let ( :item_2 ) { { item: "2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage", price: "12.49" } }
  let ( :item_3 ) { { item: "3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe", price: "15.99" } }


  it "initializes a new basket with an empty array" do
    expect(subject.basket).to eq([])

  end

  it "has an Add method" do
    expect(subject).to respond_to(:add).with(1).argument
  end

  it "has a Remove method" do
    expect(subject).to respond_to(:remove).with(1).argument
  end

  it "has a Total method" do
    expect(subject).to respond_to(:total)
  end

  it "can put something in the basket with add" do
    your_basket.add("Tasty treats")
    expect(your_basket.basket).to include("Tasty treats")
  end

  it "will give you all the items in your basket with the total" do
    your_basket.add(item_1)
    your_basket.add(item_2)
    expect { your_basket.total }.to output("Your current order:\n\n1 - Kenjutsu: Chicken, Pepperoni, Green Chili\n2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage\n\nAnd your current total is $23.48").to_stdout
  end

  it "will remove the item you told it to from your basket" do
    your_basket.add(item_1)
    your_basket.add(item_2)
    your_basket.remove(item_2)
    expect { your_basket.total }.to output("Your current order:\n\n1 - Kenjutsu: Chicken, Pepperoni, Green Chili\n\nAnd your current total is $10.99").to_stdout
  end

end

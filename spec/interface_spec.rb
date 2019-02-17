require 'interface'

describe Interface do

  let ( :interface ) { Interface.new }


  it "actually is a real interface" do
    interface
  end

  it "shows you the welcome screen with the menu" do
    expect { interface.welcome }.to output("Welcome to Samurai Pizza.\n\nOur pizzas represent the cutting edge of quality and taste:\n\n1 - Kenjutsu: Chicken, Pepperoni, Green Chili. $10.99\n2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage. $12.49\n3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe. $15.99\n\n\nPlease enter an order number to add item to basket, press 'r' to select an item to remove, 't' to see the contents of your basket and the total, 'o' to place order, or 'e' to exit:").to_stdout
  end



  it "puts something into the basket following a pizza choice" do
    pending ("Absolutely no idea how to implement this test")
    expect(interface.process(1)).to eq(basket.add(@menu[0]))
  end

  it "takes the selected item out of your basket" do
    pending ("This is getting a little bit silly")
    expect(interface.process("r")).to eq(basket.remove(@menu[0]))
  end

end

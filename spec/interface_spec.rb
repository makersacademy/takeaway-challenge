require 'interface'

describe Interface do

  let ( :interface ) { Interface.new }

  it "actually is a real interface" do
    interface
  end

  it "shows you the welcome screen with the menu" do
    expect { interface.welcome }.to output("Welcome to Samurai Pizza.\n\nOur pizzas represent the cutting edge of quality and taste:\n\n1 - Kenjutsu: Chicken, Pepperoni, Green Chili. $10.99\n2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage. $12.49\n3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe. $15.99\n").to_stdout
  end

end

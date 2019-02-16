require 'interface'

describe Interface do

  let ( :interface ) { Interface.new }

  it "actually is a real interface" do
    interface
  end

  it "shows you the welcome screen with the menu" do
    expect { interface.welcome }.to output("Welcome to Samurai Pizza.\nOur pizzas represent the cutting edge of quality and taste:\n#1 - Kenjutsu: Chicken, Pepperoni, Green Chili\n#2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage\n#3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe\n").to_stdout
  end

end

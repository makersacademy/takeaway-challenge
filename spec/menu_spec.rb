require 'menu'

describe Menu do

  let ( :menu ) { Menu.new }

  it "has a menu" do
    menu
  end

  it "will list the menu for you" do
    expect { menu.list }.to output("1 - Kenjutsu: Chicken, Pepperoni, Green Chili. $10.99\n2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage. $12.49\n3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe. $15.99\n").to_stdout
  end


end

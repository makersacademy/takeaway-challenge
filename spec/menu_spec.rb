require 'menu'

describe Menu do

  let ( :menu ) { Menu.new }

  it "has a menu" do
    menu
  end

  it "will list the menu for you" do
    expect { menu.list }.to output("#1 - Kenjutsu: Chicken, Pepperoni, Green Chili\n#2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage\n#3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe\n").to_stdout
  end


end

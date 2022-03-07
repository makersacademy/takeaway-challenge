require 'menu'

describe Menu do
  it "should show the menu when #see_menu is called" do
    menu = Menu.new
    expect { menu.see_menu }.to output(<<-output 
Pizza - £8
Burger - £9
Pasta - £6
Special Fried Rice - £5.5
Kebab - £6.5
Ice Cream - £3.2
Chocolate Cake - £2
    output
  ).to_stdout
  end
end

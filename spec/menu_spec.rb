require 'menu'

describe Menu do
  it "Shows a list of pizzas on the menu and there price" do
    menu = Menu.new
    expect{menu.list}.to output("Marinara, 6.00\n").to_stdout
  end
end

require 'menu'

describe Menu do

  let(:dish) {double :dish, :name => "Marinara", :price => 600 }

  it "Can add a dish to the menu and is now on the list" do
    menu = Menu.new
    menu.add(dish)
    expect{menu.list}.to output("Marinara : 6.00\n").to_stdout
  end

  it "Has no dishes on the menu when created" do
    menu = Menu.new
    expect{menu.list}.to_not output.to_stdout
  end
end

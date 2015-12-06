require 'menu'


describe "User Stories" do


  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "So that I can place an order, I want to know what's on the menu" do
    menu = Menu.new('lib/menu.yaml')
    expect(menu.view_menu).to eq (YAML.load_file('lib/menu.yaml'))
  end


  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "So that I can place an order, I want to be able to select a number of dishes from the menu, and add them to my basket" do
    menu = Menu.new('lib/menu.yaml')
    menu.choose(:"Kielbasa chicken", 1)
    expect(menu.basket).to eq([{:"Kielbasa chicken"=>"£4"}])
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  xit "So that I can verify my order, I would like to check my total matches the sum of my selections" do
    menu = Menu.new('lib/menu.yaml')
    menu.
    expect(menu.make_an_order).to eq Order.new
  end


  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered



end

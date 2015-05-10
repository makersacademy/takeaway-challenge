@tel_no = ENV['MY_MOBILE_NUMBER']

feature 'user orders food' do

  scenario 'sees list of dishes with prices' do
    # Set up a default menu
    default_menu = Hash.new
    default_menu["Pie and chips"] = 450
    default_menu["Fish and chips"] = 550
    default_menu["Egg and chips"] = 475
    default_menu["Chips"] = 300
    default_menu["Chips and beans"] = 400
    default_menu["Sausage and chips"] = 500
    default_menu["Chip butty"] = 350
    default_menu["Poutine"] = 475

    # Create takeaway and add the menu
    takeaway=Takeaway.new(Menu)
    takeaway.add_menu_items(default_menu)

    #Check the menu is what we expect
    expect(takeaway.list_menu).to eq(default_menu)

  end

  xscenario 'selects items and quantity to order' do
    takeaway=Takeaway.new(Menu)

    customer = Customer.new("Daniel", @tel_no)

  end

  xscenario 'shows order total and order lines to justify cost' do

  end

  xscenario 'receives SMS confirmation of order' do

  end

end

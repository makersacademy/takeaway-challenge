require 'takeaway'

describe Takeaway do
  it 'returns the menu when asked to' do
    # Set up a default menu
    default_menu = {}
    default_menu["Pie and chips"] = 450
    default_menu["Fish and chips"] = 550
    default_menu["Egg and chips"] = 475
    default_menu["Chips"] = 300
    default_menu["Chips and beans"] = 400
    default_menu["Sausage and chips"] = 500
    default_menu["Chip butty"] = 350
    default_menu["Poutine"] = 475

    # Create takeaway and add the menu
    takeaway = Takeaway.new("Bill's Chippy")
    takeaway.add_menu_items(default_menu)

    # Check the menu is what we expect
    expect(takeaway.list_menu).to eq(default_menu)
  end
end

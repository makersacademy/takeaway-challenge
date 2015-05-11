feature 'user orders food' do
  # Major issue with tests is duplication. Would ideally move a bunch of this
  # into let statements to share across all tests. Or just turn the whole
  # thing into one big test.

  scenario 'sees list of dishes with prices' do
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

  scenario 'selects items and quantity to order' do
    @tel_no = ENV['MY_MOBILE_NUMBER']
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

    # Create a customer to place an order
    customer = Customer.new("Daniel", @tel_no)

    # Create an order, add items, check correct total
    order = Order.new(customer, takeaway)
    order.add_order_line("Pie and chips", 2)
    order.add_order_line("Poutine", 3)
    expect(order.total).to eq(2325)
  end

  scenario 'shows order total and order lines to justify cost' do
    @tel_no = ENV['MY_MOBILE_NUMBER']
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

    # Create a customer to place an order
    customer = Customer.new("Daniel", @tel_no)

    # Create an order, add items
    order = Order.new(customer, takeaway)
    order.add_order_line("Pie and chips", 2)
    order.add_order_line("Poutine", 3)

    # The order display should work properly
    expected_order = ["Daniel", "Bill's Chippy",
                      [["Pie and chips", 2, 900], ["Poutine", 3, 1425]], 2325,
                      :open]

    expect(order.order).to eq(expected_order)
  end

  scenario 'receives SMS confirmation of order' do
    @tel_no = ENV['MY_MOBILE_NUMBER']
    # I've added status-checking as it's useful for tracking purposes
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

    # Create a customer to place an order
    customer = Customer.new("Daniel", @tel_no)

    # Create an order, add items
    order = Order.new(customer, takeaway)
    order.add_order_line("Pie and chips", 2)
    order.add_order_line("Poutine", 3)

    # Place the order
    message = Message.new
    # expect(message).to receive(:send).with customer, order.time
    order.place(message)
    expect(order.status).to eq :placed

  end

end

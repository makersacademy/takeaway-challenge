feature 'user_stories_spec' do

  it "so that I can order, it would like to check the menu list with prices" do
    order = Order.new
    menu = Menu.new
    expect { order.check_menu(menu) }.not_to raise_error
  end

  it "So that I can order, I would like to be able to select some number of several available dishes" do
    order = Order.new
    expect { order.select_item("soup", 2) }.not_to raise_error
  end

  it "So that I can verify my order, I would like to check that the total I have been given matches the sum of the various dishes in my order" do
    order = Order.new
    expect { order.check_order }.not_to raise_error
  end

  it "So that I know what time my order will be delivered, I would like to receive a text message such as 'Thank you! Your order was placed and will be delivered before 18:52' after I have ordered" do
    order = Order.new
    expect { order.confirmation_text }.not_to raise_error
  end

end

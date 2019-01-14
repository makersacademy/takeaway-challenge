feature 'user_stories_spec' do

  it "so that I can order, it would like to check the menu list with prices" do
    oki = Restaurant.new('oki')
    expect { oki.display_menu }.not_to raise_error
  end

  it "So that I can order, I would like to be able to select some number of several available dishes" do
    oki = Restaurant.new('oki')
    order = Order.new(oki)
    expect { order.add_item("soup", 2) }.not_to raise_error
  end


  it "So that I can verify my order, I would like to check that the total I have been given matches the sum of the various dishes in my order" do
    oki = Restaurant.new('oki')
    order = Order.new(oki)
    expect { order.check_order_summary }.not_to raise_error
  end


  it "So that I know what time my order will be delivered, I would like to receive a text message such as 'Thank you! Your order was placed and will be delivered before 18:52' after I have ordered" do
    oki = Restaurant.new('oki')
    order = Order.new(oki)
    expect { order.place_order }.not_to raise_error
  end

end

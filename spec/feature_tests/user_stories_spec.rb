feature 'user_stories_spec' do

  it "so that I can order, it would like to check the menu list with prices" do
    order = Order.new
    menu = Menu.new
    expect { order.check_menu(menu) }.not_to raise_error
  end


end
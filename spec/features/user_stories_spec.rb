describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "so a customer can see dishes and prices, instruct a takeaway to return a menu" do
    t = Takeaway.new
    expect { t.show_menu(menu) }.not_to raise_error #null test - don't expect this to raise an error
  end

end # of user stories describe block

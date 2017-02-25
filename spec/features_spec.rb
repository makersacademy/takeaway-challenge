describe "Take Away Challenge" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "Customer should be able to view a list of dishes and prices" do
    indian_resturant = Resturant.new
    menu = [{name: :lamp_chops, price: 7.0},{name: :chicken_karahi, price: 7.5},{name: :naan, price: 2.95}]
    expect(indian_resturant.show_menu).to eq menu
  end
end

describe "Take Away Challenge" do
  subject(:indian_resturant) {Resturant.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "Customer should be able to view a list of dishes and prices" do
    menu = [{name: :lamp_chops, price: 7.0},{name: :chicken_karahi, price: 7.5},{name: :naan, price: 2.95}]
    expect(indian_resturant.show_menu).to eq menu
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "Customer should be able to select dishes" do
    expect{indian_resturant.choose(name: :lamp_chops)}.to_not raise_error
  end
end

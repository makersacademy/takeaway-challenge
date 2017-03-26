require "menu"

describe Menu do

  subject(:menu) {described_class.new}

  let(:food) {double(:dish, :dish_name => "Fish", :dish_price => 5.5) }


  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "Has dishes" do
    menu.add_dish(food)
    expect(menu.board).not_to be_empty
  end

  it "Can see the price of the dish" do
    menu.add_dish(food)
    expect(menu.board[0].dish_price).to eq 5.5
  end

end

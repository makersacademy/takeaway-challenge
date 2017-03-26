require "menu"

describe Menu do

  subject(:menu) {described_class.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "Has an array of dishes and prices" do
    expect(menu.board).to be_truthy
  end





end

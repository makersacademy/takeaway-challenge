require 'menu.rb'

describe Menu do

  it "displays menu list" do
    expect(subject.menu_pricelist["chicken katsu"]).to eq(3.5)
  end

  it "raises error when a dish is unavailable" do
    expect{ subject.dish_available? "pasta" }.to raise_error(
    "Sorry! That dish is not on the menu.")
  end

  it "true when a dish is available" do
    expect(subject.dish_available? "chicken katsu").to eq(true)
  end

end

require 'Menu'

describe Menu do
  let(:menu) {Menu.new}
  it "starts with a non-empty list of dishes" do
    expect(menu.dishes.length).to be > 0
  end

  it "should only include dishes" do
    menu.dishes.each do |object|
      expect(object).to be_a Dish
    end
  end
end
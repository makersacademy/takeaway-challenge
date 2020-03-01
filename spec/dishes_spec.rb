require 'dishes'


describe Dishes do
  let(:dishes) {Dishes.new}
  it "initializes with a list a of dishes" do
    expect(dishes.menu).not_to be_empty
  end
  it "shows the user the menu items" do
    expect{dishes.see_menu}.to output(String).to_stdout
  end


end

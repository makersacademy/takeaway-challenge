require 'menu'

describe Menu do
  it "should load menu from csv file" do
    dishes = Menu.new
    dishes.load_menu
    expect(dishes.menu).to_not eq nil
  end
end

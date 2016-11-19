require "menu"

describe Menu do

subject(:menu){ described_class.new }

it "should respond to add menu items" do
  expect(menu).to respond_to(:add_menu_items)
end

it "should be able to add an array of menu items" do
 expect(menu.add_menu_items).to be_a(Array)
end

it "should return a menu item" do
 expect(menu.menu_item(1)).to be_a(Array)
end

end

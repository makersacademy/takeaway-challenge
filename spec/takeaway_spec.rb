require "Takeaway"
require "menu"

describe Takeaway do

#before(:each) { :menu = Menu.new }


it "should respond to add menu items" do
  expect(subject).to respond_to(:add_menu_items)
end

it "should be able to add an array of menu items" do
  menu = Menu.new
  expect(subject.add_menu_items(menu)).to be_an(Array)
end

it "should return a menu item" do
  menu = Menu.new
  subject.add_menu_items(menu)
  expect(subject.menu[1]).to be_an(Array)
end

end

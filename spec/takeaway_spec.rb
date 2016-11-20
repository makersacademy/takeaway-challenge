require "Takeaway"
require "menu"

describe Takeaway do

#before(:each) { :menu = Menu.new }


it "should respond to add menu items" do
  expect(subject).to respond_to(:load_menu_items)
end

it "should be able to add an array of menu items" do
  expect(subject.load_menu_items).to be_an(Array)
end

it "should return a menu item" do
  subject.load_menu_items
  expect(subject.menu[1]).to be_an(Array)
end

end

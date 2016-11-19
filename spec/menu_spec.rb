require "menu"

describe Menu do

it "should respond to add menu items" do
  expect(subject).to respond_to(:add_menu_items)
end

end

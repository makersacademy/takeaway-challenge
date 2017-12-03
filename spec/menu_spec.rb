require "menu.rb"

describe Menu do

it "should show a list of dishes" do
  expect(menu.show_dishes).to respond_to(:show_dishes)
end

end

require "menu.rb"

describe Menu do
  subject(:menu) {described_class.new}

it "should show a list of dishes" do
  expect(menu).to respond_to(:show_dishes)
end

end

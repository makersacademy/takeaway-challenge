require "menu"

describe Menu do

it "creates an instance of menu class" do
  menu = Menu.new("Chinese")
expect(menu.takeaway).to eq("Chinese")
  end
end

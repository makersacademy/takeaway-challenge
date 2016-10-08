require "takeaway"
require "menu"
# require "orders"

describe Menu do

context "show_menu" do
  it "shows a list of dishes with prices" do
    menu = Menu.new
    expect(menu.show_menu).to eq menu.hash_menu
  end
end
end

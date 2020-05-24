require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, read: menu_list) }
  let(:menu_list) { "Hallomi Fries £5.50, Chicken Wings £5.99" }


  it "shows the menu with dishes and prices" do
    expect(takeaway.show_menu).to eq(menu_list)
  end
end
require "takeaway"
require "menu"

describe Takeaway do

  let(:curry) { double :curry, :name => "curry", :price => 8.5 }
  let(:naan) { double :naan, :name => "naan", :price => 3 }
  let(:menu) { double :menu, :dishes => [curry, naan] }

  it "should be able to show the menu" do
    actual_menu = Menu.new
    actual_menu.add(curry)
    actual_menu.add(naan)
    actual_takeaway = Takeaway.new(actual_menu)
    # struggled using doubles in above test
    expect { actual_takeaway.show_menu }.to output("curry, £8.5\nnaan, £3\n").to_stdout
  end

  it "should be able to add items to order" do
    actual_menu = Menu.new
    actual_menu.add(curry)
    actual_menu.add(naan)
    actual_takeaway = Takeaway.new(actual_menu)
    actual_takeaway.add_to_order("curry")
    actual_takeaway.add_to_order("naan")
    expect(actual_takeaway.order).to match_array([curry, naan])
  end

end

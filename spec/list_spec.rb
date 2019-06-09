require 'list'

describe List do

  it "contains a menu" do
    list = List.new
    expect(list.menu).to eq({ "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 })
  end

  it "contains an recipt of ordered dishes, shows the recipt"do
    list = List.new
    expect(list.show_finished_order_recipt).to eq(0)
  end

  it "responds to the method #show_menu" do
    list = List.new
    expect(list).to respond_to(:show_menu)
  end

  it "shows the menu" do
    list = List.new
    expect(list.show_menu).to eq({ "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 })
  end

  it "responds to the method #add_dish" do
    list = List.new
    expect(list).to respond_to(:add_dish)
  end

end

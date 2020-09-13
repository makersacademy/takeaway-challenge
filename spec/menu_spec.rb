require "menu"

describe Menu do
  menu_list = "1: Pizza, £7  2: Pasta, £6  3: Beer, £4  "
  it "list menu items" do
    expect(subject.list_items).to eq(menu_list)  
  end
  it "responds to #item" do
    expect(subject).to respond.to(:selection)
  end
end

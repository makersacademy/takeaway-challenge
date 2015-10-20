require 'menu'

describe Menu do

  let(:menu_item1) {double :menu_item1, name: "Curry", price: 5}

  it "should display a list of dishes and menus" do
    subject.add_item(menu_item1)
    expect(subject.list_menu.count).to eql(1)
  end




end

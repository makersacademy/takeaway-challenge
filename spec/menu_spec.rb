require 'menu'

describe Menu do
  it "load the menu, get back 10 dishes" do
    expect(subject.load_menu.size).to be(10)
  end
  it "show user the menu" do
    subject.load_menu
    expect(subject.show_menu).to eq("1: Chicken - £10.99\n2: Beef - £11.99\n3: Wine - £4.99\n4: Beer - £1.99\n5: Noodles - £2.99\n7: Pork - £12.00\n8: Lamb - £11.54\n9: Soup - £1.50\n10: Cheese - £3.99\n")
  end
  it "order selected menu option 1" do
    subject.load_menu
    expect(subject.order(1)[0].describe).to eq("1: Chicken - £10.99")
  end
  it "order not returned for menu option 5" do
    subject.load_menu
    expect(subject.order(1)[4]).to eq(nil)
  end
  it "order selected menu option 1,5,7,9" do
    subject.load_menu
    expect(subject.order(1, 5, 7, 9)[0].describe).to eq("1: Chicken - £10.99")
    expect(subject.order(1, 5, 7, 9)[1].describe).to eq("5: Noodles - £2.99")
  end
  it "order 6 should not return" do
    subject.load_menu
    expect(subject.order(6)).to eq([])
  end
end

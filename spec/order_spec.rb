require "order"

describe Order do

  it "will successfully load the menu from the csv file of 9 dishes" do
    expect(subject.load_menu.size).to be(9)
  end

  it "will successfully show the full menu" do
    subject.load_menu
    expect(subject.show_menu).to eq("1: Pizza - £10.00\n2: Sushi - £8.99\n3: Curry - £11.00\n4: Chinese - £7.00\n5: Noodles - £5.00\n6: Burger - £8.00\n7: Cheeseburger - £8.50\n8: Chips - £3.00\n9: Dessert - £4.00\n")
  end

  it "will successfully order dish 1 from the menu" do
    subject.load_menu
    expect(subject.order(1)[0].details).to eq("1: Pizza - £10.00")
  end

  it "it will not be able to return a value for a second unique dish if only one dish is ordered" do
    subject.load_menu
    expect(subject.order(1)[1]).to eq(nil)
  end

  it "it will not be able to return a value for dish 10 as it does not exist" do
    subject.load_menu
    expect(subject.order(10)).to eq([])
  end

  it "it will be able to return a value for a second unique dish if more than one dish is ordered" do
    subject.load_menu
    expect(subject.order(1, 3, 8)[0].details).to eq("1: Pizza - £10.00")
    expect(subject.order(1, 5, 6, 9)[1].details).to eq("5: Noodles - £5.00")
  end

  it "will successfully return the total for an order" do
    subject.load_menu
    subject.order(1, 3, 4)
    expect(subject.check_total()).to eq(28.00)
  end

end

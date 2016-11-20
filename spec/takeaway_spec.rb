require 'takeaway'

describe TakeAway do
  subject(:takeaway) {described_class.new}

  it "shows the menu list" do
    menu_list = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
    expect(takeaway.read_menu).to eq menu_list
  end

  it "takes the order" do
    expect(takeaway.order("spring roll")).to eq "1x spring roll(s) added to your basket."
    expect(takeaway.order("char sui bun",2)).to eq "2x char sui bun(s) added to your basket."
  end

  it "takes the order summary" do
    takeaway.order 'spring roll', 4
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96"
  end
  it "doesn't take the same order " do
    takeaway.order 'spring roll'
    takeaway.order 'spring roll'
    takeaway.order 'spring roll', 4
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96"
  end

  it "adds multiple orders" do
    takeaway.order 'spring roll', 4
    takeaway.add 'pork dumpling', 3
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
  end

end

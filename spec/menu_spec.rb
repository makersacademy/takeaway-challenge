require 'menu'

describe Menu do
  it "displays a list of items" do
    expect(subject.list).to eq "pizza £9.00\npasta £8.00\ncurry £10.00\nburger £11.00\nveggie burger £10.00\n"
  end

  it "can add new items to the menu" do
    subject.add_item('sausage roll', 2.00)
    expect(subject.items).to include 'sausage roll'
  end

end

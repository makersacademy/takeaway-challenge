require 'menu'

describe Menu do
  # it "can create a menu item" do
  #   expect { subject.add_item('BBQ', 10) }.
  #     to change { subject.menu.size }.by(1)
  # end
  #
  it "diplays menu items" do
    expect { subject.show }.to output("1. dish: £BBQ\n1. price: £10\n2. dish: £Hamburger\n2. price: £8\n3. dish: £Pizza\n3. price: £9\n4. dish: £Pasta\n4. price: £7\n5. dish: £Sushi\n5. price: £6\n").to_stdout
  end
end

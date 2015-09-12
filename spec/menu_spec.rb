require 'menu'

describe Menu do
  # it "can create a menu item" do
  #   expect { subject.add_item('BBQ', 10) }.
  #     to change { subject.menu.size }.by(1)
  # end
  #
  it "diplays menu items" do
    expect { subject.show }.to output("1. BBQ: £10\n2. Hamburger: £8\n3. Pizza: £9\n4. Pasta: £7\n5. Sushi: £6\n").to_stdout
  end
end

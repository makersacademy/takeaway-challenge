require 'menu'

describe Menu do
  # it "can create a menu item" do
  #   expect { subject.add_item('BBQ', 10) }.
  #     to change { subject.menu.size }.by(1)
  # end
  #
  it "diplays menu items" do
    expect { subject.show }.to output("1. bbq: £10\n2. hamburger: £8\n3. pizza: £9\n4. pasta: £8\n5. sushi: £10\n").to_stdout
  end
end

require 'menu'

describe Menu do
  it "diplays menu items" do
    expect { subject.show }.
    to output("1. BBQ: £10\n2. Hamburger: £8\n" +
    "3. Pizza: £9\n4. Pasta: £7\n5. Sushi: £6\n").to_stdout
  end
end

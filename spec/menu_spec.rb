require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:dish) { double(:dish) }

  it "lists available dishes" do
    expect { menu.show }.to output(a_string_including("2. Soup for £5.99")).to_stdout
  end
  it "can add new dish" do
    expect(menu.add(dish)).to include(dish)
  end
  it "finds out the price" do
    expect(menu.cost_of("Soup")).to eq(5.99)
  end
end

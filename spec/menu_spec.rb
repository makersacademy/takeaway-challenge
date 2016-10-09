require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'has a list of dishes with prices' do
    expect(menu.items.length).to eq 2
    expect(menu.items.first).to be_a Dish
    expect(menu.items.first.price).to eq 5
    expect(menu.items.first.name).to eq "pie"
  end

  it 'return a dish when ordered' do
    expect(menu.order("pie")).to have_attributes(name: "pie")
  end

  it "raises an error if ordered item is not on the menu" do
    expect { menu.order("chips") }.to raise_error("Please select an item from the menu.")
  end
end

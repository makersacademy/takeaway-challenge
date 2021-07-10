require "menu"

describe Menu do
  let(:item) { double(:item_double, 1) }
  
  it "is a hash containing items" do
    expect(subject).to respond_to(:list)
  end

  it "lists the food options" do
    expect{ subject.list }.to output("Menu\nBurger: £5.00\nChips: £2.00\nNoodles: £4.50\nPizza: £7.00\nKielbasa: £3.00\nEgg: £1.00\nPlatter: £20.00\nWater: £99.99\n").to_stdout
  end

  it "allows the selection of multiple dishes" do
    subject.select("Burger")
    expect(subject.selected_items).to include({"Burger" => 5.0})
  end
end
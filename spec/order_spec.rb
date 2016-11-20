require "order"

describe Order do
  subject(:order) { described_class.new }

  let(:menu) do
    {
      cheeseburger: "£8.50",
      fries: "£3.75"
    }
  end

  it "has a list of dishes with prices" do
    expect(order.menu).to eq(menu)
  end

  it "allows the selection of a dish" do
    selection = order.select_dish("cheeseburger")
    expect(selection).to eq(["cheeseburger: £8.50"])
  end

  it "saves the selecion of all dishes" do
    order.select_dish("fries")
    order.select_dish("cheeseburger")
    expect(order.selection).to eq(["fries: £3.75", "cheeseburger: £8.50"])
  end

  xit "prints a list of dishes with prices" do
    expect(subject.print_menu).to ("Cheeseburger: £8.50
    Fries: £3.75"
    )
  end

end

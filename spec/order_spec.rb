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
    selection = order.select_dish(1, "cheeseburger")
    expect(order.list_of_dishes).to eq(["cheeseburger: £8.50"])
  end

  it "saves the selecion of all dishes" do
    order.select_dish(1, "fries")
    order.select_dish(1, "cheeseburger")
    expect(order.list_of_dishes).to eq(["fries: £3.75", "cheeseburger: £8.50"])
  end

  it "allows the customer to order multiple quantities of a dish" do
    expect(order.select_dish(2, "fries")).to eq(["fries: £3.75", "fries: £3.75"])
  end

  xit "prints a list of dishes with prices" do
    expect(subject.print_menu).to eq("Cheeseburger: £8.50
    Fries: £3.75"
    )
  end

end

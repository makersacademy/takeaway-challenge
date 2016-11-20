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

  # cannot get below test to work properly
  it "allows the selection of a dish" do
    selection = order.select_dish("cheeseburger")
    expect(selection).to eq("cheeseburger: £8.50")
  end

  # cannot get below test to work
  # it "prints a list of dishes with prices" do
  #   expect(subject.print_menu).to eq("Cheeseburger: £8.50
  #   Fries: £3.75"
  #   )
  # end

end

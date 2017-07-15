require 'order'

describe Order do
  let(:menu) {
    double(
      :menu,
      name: "Dominos",
      dishes:
      {
        "Cheese & Tomato" => 6,
        "Mighty Meaty" => 9,
        "Pepperoni Passion" => 8,
        "Tandoori Hot" => 9,
        "Vegi Sizzler" => 8
      }
    )
  }
  subject(:order) { described_class.new(menu)}

  it 'can read a menu' do
    menu = double(:menu, name: "Dominos", dishes: { "Cheese & Tomato" => 6 })
    order = Order.new(menu)
    menu_output = "Dominos Menu\nCheese & Tomato                6.00\n"
    allow(menu).to receive(:to_s).and_return(menu_output)
    expect { puts order.read_menu }.to output(menu_output).to_stdout
  end

end

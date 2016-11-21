require 'restaurant'

describe Restaurant do

  let(:restaurant) {described_class.new(order_class, menu_class)}
  let(:printed_menu) {"pizza: £10\nburger: £5\ncoke: £1\n"}
  let(:printed_basket) {"1 pizza\n"}
  let(:printed_multiple) {"2 pizzas\n1 coke\n"}

  let(:menu_class) { double "Menu", list: menu} #Menu.list => menu
  let(:menu) do {pizza: 10, burger: 5, coke: 1} end

  let(:order_class) { double "Order", new: order } #Order.new => order
  let(:order) {double :order }


  it 'shows the menu' do
    expect{restaurant.print_menu}.to output(printed_menu).to_stdout
  end

  it 'returns a the price of an item' do
    expect(restaurant.menu[:pizza]).to eq 10
    expect(restaurant.menu[:burger]).to eq 5
  end

  it 'has an empty basket to begin with' do
    expect(restaurant.basket).to be_empty
  end

  it "can add items to the basket" do
    restaurant.add_to_basket("pizza")
    expect(restaurant.basket).to eq ({pizza: 1})
  end

  it "can add multiple items to the basket" do
    3.times{restaurant.add_to_basket("pizza")}
    restaurant.add_to_basket("coke")
    expect(restaurant.basket).to eq ({pizza: 3, coke: 1})
  end

  it "prints the basket" do
    restaurant.add_to_basket("pizza")
    expect{restaurant.show_basket}.to output(printed_basket).to_stdout
  end

  it "prints multiple items" do
    2.times{restaurant.add_to_basket("pizza")}
    restaurant.add_to_basket("coke")
    expect{restaurant.show_basket}.to output(printed_multiple).to_stdout
  end

  it "places a new order" do
    expect(order_class).to receive(:new).with({pizza: 2, coke:1}, menu_class, 21)
    2.times{restaurant.add_to_basket("pizza")}
    restaurant.add_to_basket("coke")
    restaurant.checkout(21)
  end

  it "prints the calculated total" do
    allow(order).to receive(:calculate_total).and_return(21)
    2.times{restaurant.add_to_basket("pizza")}
    restaurant.add_to_basket("coke")
    expect {restaurant.print_total}.to output("Your total is £21.00\n").to_stdout
  end




end

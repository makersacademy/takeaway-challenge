require 'restaurant'

describe Restaurant do

  let(:restaurant) {described_class.new(order_class, menu_class)}
  let(:printed_menu) {"pizza: £10\nburger: £5\ncoke: £1\n"}
  let(:printed_basket) {"1 pizza\n"}
  let(:printed_multiple) {"2 pizzas\n1 coke\n"}
  let(:payment) {21}

  let(:menu_class) { double "Menu", list: menu} #Menu.list => menu
  let(:menu) do {pizza: 10, burger: 5, coke: 1} end

  let(:order_class) { double "Order", new: order } #Order.new => order
  let(:order) {double :order, add_to_basket: nil, basket: nil, send_message: nil, check_payment: nil}


  it 'shows the menu' do
    expect{restaurant.print_menu}.to output(printed_menu).to_stdout
  end

  it 'returns a the price of an item' do
    expect(restaurant.menu[:pizza]).to eq 10
    expect(restaurant.menu[:burger]).to eq 5
  end

  it "can add items to the basket" do
    expect(order).to receive(:add_to_basket).with("pizza")
    restaurant.add_to_basket("pizza")
  end

  it "prints the basket" do
    allow(order).to receive(:basket).and_return({pizza: 1})
    expect{restaurant.show_basket}.to output(printed_basket).to_stdout
  end

  it "prints multiple items" do
    allow(order).to receive(:basket).and_return({pizza: 2, coke: 1})
    expect{restaurant.show_basket}.to output(printed_multiple).to_stdout
  end

  it "places a new order" do
    expect(order).to receive(:check_payment).with(payment)
    allow(order).to receive(:basket).and_return({pizza: 2, coke: 1})
    restaurant.checkout(21)
  end

  it "prints the calculated total" do
    allow(order).to receive(:calculate_total).and_return(payment)
    expect {restaurant.print_total}.to output("Your total is £21.00\n").to_stdout
  end




end

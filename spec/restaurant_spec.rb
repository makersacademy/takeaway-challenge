require 'restaurant'

describe Restaurant do

  let(:restaurant) {described_class.new(Order)}
  let(:printed_menu) {"pizza: £10\nburger: £5\ncoke: £1\n"}
  example_order = {}
  let(:printed_basket) {"1 pizza\n"}
  let(:printed_multiple) {"2 pizzas\n1 coke\n"}

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
    expect(restaurant.basket).to eq ({pizza: 3})
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




end

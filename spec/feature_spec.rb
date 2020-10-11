require 'restaurant'

describe "takeaway features" do

  let(:restaurant) {Restaurant.new}

  it 'can print the menu' do
    expect{restaurant.print_menu}.to output("1. trout_snout: £6.50\n2. hog_soup: £4.90\n3. mysterious_dumpling: £8.00\n4. boring_sandwich: £4.00\n5. cuttlefish_pate: £11.00\n6. hoof_broth: £3.30\n").to_stdout
  end

  before do
    io = StringIO.new
    io.puts"2"
    io.puts"3"
    io.puts"3"
    io.puts"4"
    io.rewind
    $stdin = io
  end
  after do
    $stdin = STDIN
  end

  it "can receive an order and print an accurate receipt" do
    restaurant.create_order
    restaurant.choose_dish
    restaurant.choose_quantity
    restaurant.choose_dish
    restaurant.choose_quantity
    restaurant.check_bill
    expect{restaurant.print_receipt}.to output("hog_soup: £4.90\nhog_soup: £4.90\nhog_soup: £4.90\nmysterious_dumpling: £8.00\nmysterious_dumpling: £8.00\nmysterious_dumpling: £8.00\nmysterious_dumpling: £8.00\nTotal: £46.70\n").to_stdout
  end

end

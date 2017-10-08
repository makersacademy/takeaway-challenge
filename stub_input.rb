describe 'order_total' do

  before do
    $stdin = StringIO.new("GAZPATCHO")
  end

  after do
    $stdin = STDIN
  end

  it 'prints the cost of the order' do
    o = Order.new
    o.order_items
    expect { o.order_total }.to output("Your total price is £6.0\n").to_stdout
  end

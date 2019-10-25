require 'takeaway'

describe Takeaway do
  before(:each) do
    @takeaway = Takeaway.new
  end

  it 'should initialize object correctly' do
    expect(@takeaway).to be_instance_of(Takeaway)
  end

  it 'should show list of dishes with prices' do
    expect { @takeaway.menu }.to output(/soup/).to_stdout
  end

  it 'should get correct total price' do
    quantity = rand(1..5)
    dish_name = "test"
    dish_price = 1.23
    takeaway = Takeaway.new({ dish_name => dish_price })
    takeaway.order(dish_name, quantity)
    expect(takeaway.order_summary).to match(/Total: ‽#{dish_price * quantity}/)
  end

  it 'should raise error if check out with incorrect price' do
    expect { @takeaway.checkout(1) }.to raise_error("Incorrect total price")

    takeaway = Takeaway.new({ "test" => 0.1 })
    takeaway.order("test", 1)
    expect { takeaway.checkout(0.2) }.to raise_error("Incorrect total price")
  end

  it 'should send text message' do
    name = "test"
    price = 1.11
    takeaway = Takeaway.new({ name => price })
    # Prevent from actually sending a text, using stub
    allow(takeaway).to receive(:send_text)
    takeaway.order(name, 2)
    expect(takeaway).to receive(:send_text).with(/Total: ‽#{price * 2}/)
    takeaway.checkout(price * 2)
  end
end

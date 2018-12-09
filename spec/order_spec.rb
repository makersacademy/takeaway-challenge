require './lib/order'
require './lib/menu'
require './lib/takeaway'
describe Order do
  let(:order) { Order.new(Takeaway.new('Pollys Pie Emporium')) } # Contructor injection - A  type of dependancy injection

  before do
    allow(order).to receive(:send_text)
  end

  it 'Adds items from the menu to the shopping cart' do
    order.add('Chicken Pie')
    expect(order.cart).to eq [{ "Chicken Pie" => 5 }]
  end

  it 'Adds multiple items to the cart' do
    order.add('Chicken Pie')
    order.add('Chicken Pie')
    order.add('Liver Pie')
    expect(order.cart).to eq [{ 'Chicken Pie' => 5 }, { 'Chicken Pie' => 5 }, { 'Liver Pie' => 3 }]
  end

  it 'Prints an order summary' do
    order.add('Chicken Pie')
    order.add('Chicken Pie')
    order.add('Liver Pie')
    expect(order.finish_and_confirm).to eq("Chicken Pie . . . . . £5 \nChicken Pie . . . . . £5 \nLiver Pie . . . . . £3 \nThe total for your order is: £13")
  end

  it 'sends a payment confirmation text message' do
    time = (Time.now + (60 * 60)).strftime("%k:%M")
    expect(order).to receive(:send_text).with("Thank you for ordering from Pollys Pie Emporium, your final price is: £10 and will delivered at #{time}")
    order.add('Chicken Pie')
    order.add('Chicken Pie')
    order.complete
  end
end

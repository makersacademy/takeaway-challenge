require 'takeaway'
# require 'twillo-ruby'

describe Takeaway do

  let(:takeaway)      { Takeaway.new(order_class, menu_class, send_message_class) }
  let(:order_class)  { double(:order_class, :new => order) }
  let(:order)        { double(:order) }
  let(:menu_class) {double(:menu_class, :new => menu)}
  let(:menu) { double(:menu, :menu_dishes => {pizza: 4.00})}
  let(:send_message_class)    { double(:send_message_class, :new => send_message) }
  let(:send_message)   { double(:send_message) }
  
  it 'List the menu for customer' do
    expect(menu).to receive(:list_menu)
    takeaway.display_menu
  end

  # it "Selected menu items" do
  #   expect(order).to receive(:select_dishes)
  #   takeaway.ordered_items(:pizza, 1)
  # end

  # it "Checkout total" do
  #   expect(order).to receive(:price)
  #   takeaway.cost_of_order
  # end

  # it "Checkout total" do
  #   expect(order).to receive(:price)
  #   takeaway.is_correct_price?(expected_price)
  # end

  it 'Sends a text message confirming order' do
    expect(send_message).to receive(:send_customer_message)
    takeaway.send_text_message
  end

  # it 'Order incomplete error' do
  #   allow(order).to receive(:price).and_return(false)
  #   expect{takeaway.place_order}.to raise_error("Order incomplete")
  # end

end
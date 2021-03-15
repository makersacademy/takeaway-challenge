require 'takeaway'
require 'order'
require 'menu'
require 'dish'
require 'twilio-ruby'

describe Takeaway do

  it 'looks at the menu, selects two dishes,
   looks at the total, completes the order,
    sends a confirmation text' do
    takeaway = Takeaway.new
    takeaway.select_dish(takeaway.menu.list_dishes.first)
    takeaway.select_dish(takeaway.menu.list_dishes.last)
    takeaway.order.verify_total
    allow(takeaway.order).to receive(:complete) { "18:52" }
    expect(takeaway.order_complete(takeaway.order)).to eq("Thank you! Your order was placed and will be delivered before 18:52")
  end

end

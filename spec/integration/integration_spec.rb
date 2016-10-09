require 'takeaway'
require 'order'
require 'order_item'
require 'menu'
require 'sms_notifier'

describe 'Takeaway integration', :integration => true do
  subject(:takeaway) do
    sms = SmsNotifier.new
    menu = Menu.new
    order = Order.new
    Takeaway.new(menu, order, Time, sms)
  end

  it 'has menu with a list of dishes and prices' do
    expect(takeaway.view_menu.length).to eq 2
  end

  it "orders a given quantity of an item from the menu" do
    takeaway.order_item("pie", 2)
    expect { takeaway.checkout(10) }.not_to raise_error
  end

end

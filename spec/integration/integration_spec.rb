require 'takeaway'
require 'order_item'
require 'menu'

describe 'Takeaway integration', :unit => false do
  subject(:takeaway) do
    sms = SmsNotifier.new
    menu = Menu.new
    Takeaway.new(menu, Time, sms)
  end

  it 'has menu with a list of dishes and prices' do
    expect(takeaway.view_menu.length).to eq 2
  end

  it "orders a given quantity of an item from the menu" do
    takeaway.order_item("pie", 2)
    expect { takeaway.checkout(10) }.not_to raise_error
  end

end

require './lib/order'
require './lib/submitorder'

describe 'takeaway order feature' do
  menu1 = Menu.new
  menu1.add_dish 'Pizza',4.99
  menu1.add_dish 'Hamburger',1.99
  order1 = Order.new menu1
  order1.pick_menu_item 1
  order1.pick_menu_item 2
  account_sid = 'ACaa9d88865685ca7e9bdec766b71fa313'
  auth_token = '7fcdf88aeafb171703682f9e91c42d97'
  subject {SubmitOrder.new account_sid, auth_token}

  from_mobile = '+441384901121'
  to_mobile = '+447914245451' #+447508059316 other verified number
  message_body = 'This is a Twillo Test for takeaway challenge'

  message =   {from: from_mobile,
              to: to_mobile,
              body: message_body}

  context 'when order for two items made' do
    it '#total' do
      subject.get(order1,6.98)
      expect(subject.submit message).to eq "Order OK and sent expect a text message confirmation"
    end
  end


end
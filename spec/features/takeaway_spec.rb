require './lib/order'

describe 'takeaway order feature' do
  menu1 = Menu.new
  menu1.add_dish 'Pizza',4.99
  menu1.add_dish 'Hamburger',1.99
  subject {Order.new menu1}


  context 'when order for two items made' do
    it '#total' do
      subject.pick_menu_item 1
      subject.pick_menu_item 2
      expect(subject.total).to eq 6.98
    end
  end


end
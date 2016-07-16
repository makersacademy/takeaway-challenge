require 'takeaway'
require 'menu'

describe TakeAway do

 describe '#menu' do
   it { is_expected.to respond_to(:show_menu) }
   it 'should show the menu' do
     menu = Menu.new
   expect(menu.items).to include("Crocodile burger" => 14.25)
 end
 end

 describe '#order' do
   it { is_expected.to respond_to(:take_order) }
   it 'checks the dish is on the menu' do
     order = TakeAway.new
     expect{order.take_order("hamburger")}.to raise_error "Sorry, that item is not on the menu"
   end


   end

it {is_expected.to respond_to(:include?) }
it { is_expected.to respond_to(:order_summary) }
it { is_expected.to respond_to(:order_total) }
it { is_expected.to respond_to(:checkout) }
it { is_expected.to respond_to(:confirmed?) }

end

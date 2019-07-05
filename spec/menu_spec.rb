 require 'menu'
 
 describe Menu do
   subject(:menu) { described_class.new }
   describe '#display_menu' do
     it "should return the menu as a 'nice' string" do
       expect(menu.display_menu).to eq "Fish: £7\nChips: £3"
     end
   end
 end

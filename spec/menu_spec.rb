# require 'menu'

# describe Menu do

#   let(:menu_dbl) { double :menu, menu: Menu.new}
#   let(:add_dbl) { double :add, add: {"Hoisin Duck" => 10}}
#   # let(:takeaway_dbl) { double :takeaway, menu: { "KPC" => 6.50 }}

#   context "#initialize" do
#     it 'initializes with a menu' do
#       expect(subject).to have_attributes(menu: Hash)
#     end
#   end
#   context '#display' do
#     it 'displays menu when called' do
#       expect(subject.display).to be_a_kind_of(Hash)
#       allow(menu_dbl).to receive(:add_dbl).and_return({"Hoisin Duck" => 10})
#     end
#   end
# end
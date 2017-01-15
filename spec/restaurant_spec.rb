# require './lib/restaurant'
#
# describe Restaurant do
#
#   # subject(:menu_list) { described_class.new }
#
#   describe '#menu_list' do
#
#     it "is a hash which includes a key" do
#       expect(subject.menu_list).to have_key(:choripan)
#     end
#     it "is a hash of dishes with their prices" do
#       expect(subject.menu_list).to include { {:choripan=>7.95} }
#     end
#
#   end
#
#   describe '#order' do
# 
#     it "allows to order an item from the menu_list" do
#       expect(subject.order :choripan ).to eq [:choripan]
#
#     end
#
#   end
#
# end

# require 'menu'
#
#   describe Menu do
#
#   subject(:menu) { described_class.new }
#
#   describe "#print_menu" do
#
#
#     it "prints a list of dishes with prices" do
#       printed_menu = "Pizza £7.50, Burger £6.50, Pasta £5.00"
#       expect(menu.print_menu).to eq(printed_menu)
#     end
#   end
#
#
#   class DummyClass
#   end
#
#   before(:each) do
#     @dummy_class = DummyClass.new
#     @dummy_class.extend(Menu)
#   end
#
#   it "prints a list of dishes with prices" do
#     printed_menu = "Pizza £7.50, Burger £6.50, Pasta £5.00"
#     expect(@dummy_class.print_menu).to eq(printed_menu)
#   end
#
# end

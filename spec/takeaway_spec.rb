require "takeaway"
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Spaghetti Lobster: £30.00" }
# # As a customer
# # So that I can check if I want to order something
# # I would like to see a list of dishes with prices
  it "shows menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
# # As a customer
# # So that I can order the meal I want
# # I would like to be able to select some number of several
# # available dishes
#   it "will allow selection of several available dishes" do
#
#   end
# # As a customer
# # So that I can verify that my order is correct
# # I would like to check that the total I have been given matches
# # the sum of the various dishes in my order
#   it "will check that total matches sum of dishes" do
#
#   end
# # As a customer
# # So that I am reassured that my order will be delivered on time
# # I would like to receive a text such as "Thank you! Your order
# # was placed and will be delivered before 18:52" after I have ordered
#   it "will receive a text when order is placed" do
#
#   end
end

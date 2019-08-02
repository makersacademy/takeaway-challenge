require 'menu'

  describe Menu do

    describe "#print_food" do
        it "has a list of names and prices" do
          order_double = double :order
          order_class_double = double :order_class, new: order_double
          let

          menu = Menu.new(order_class_double)
          expect(order_double).to receive(:add)
          menu.print_food
        end
    end
end


# require 'menu'
#
# describe Menu do
#   it "prints a list of names and prices" do
#     expect(subject.print).to eq PRINTED_MENU
#   end
# end

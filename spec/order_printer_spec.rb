# todo: struggled to get these tests to work

# require 'order_printer'

# describe OrderPrinter do

#   describe '#print' do

#     let(:item_printer_module) { double(:item_printer_module) }
#     let(:dish_double) { double('dish') name:'yummy', price: 9.99}
#     let(:order) { double([ {dish_double: 1 } ]) }

#     it "sends each dish to the dish_printer" do
#       expect(item_printer_module)
#         .to receive(:print).with(order[0])
#         described_class.print(order, item_printer_module)
#     end
#   end
# end

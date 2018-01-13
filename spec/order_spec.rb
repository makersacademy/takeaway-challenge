# require 'order'
#
# describe Order do
#
#   # subject(:order) { described_class.new }
#   order = Order.new
#   let(:selected_dish) { double :selected_dish }
#   let(:quantity) { double :quantity }
#   let(:io_obj) { double :io_obj }
#   # before do
#   #   io_obj = double
#   #   expect(subject).to receive(:gets).and_return(io_obj).twice
#   #   expect(io_obj).to receive(:chomp).and_return(:selected_dish)
#   #   expect(io_obj).to receive(:chomp).and_return(:quantity)
#   # end
#
#
#   # it 'should initialize with a list of dishes and prices' do
#   #   expect(menu.price_list).to eq price_list
#   # end
#
#   describe 'select' do
#
#     it 'should respond to the select dish method' do
#       expect(order).to respond_to(:select)
#     end
#
#   end
#
#   # describe '#select [chomp elements]' do
#   #
#   #   # before do
#   #   #   expect(order).to receive(:gets).and_return(io_obj).twice
#   #   #   expect(io_obj).to receive(:chomp).and_return(:selected_dish)
#   #   #   expect(io_obj).to receive(:chomp).and_return(:quantity)
#   #   # end
#   #   #
#   #   # it 'sets @selected_dish and @quantity according to user input' do
#   #   #   order.select
#   #   #   expect(order.instance_variable_get(:@selected_dish)).to eq :selected_dish
#   #   #   expect(order.instance_variable_get(:@quantity)).to eq :quantity
#   #   # end
#
#   describe 'select_dish' do
#     before do
#       expect(order).to receive(:gets).and_return(io_obj)
#       expect(io_obj).to receive(:chomp).and_return(:selected_dish)
#     end
#
#     it 'sets a selected_dish according to user input' do
#       order.select_dish
#       expect(order.instance_variable_get(:@selected_dish)).to eq :selected_dish
#     end
#   end
#
#
#
#
#
#     # it 'should display the list of dishes and prices' do
#     #   expect(menu.display).to eq price_list.each{|k, v| puts "#{k} : #{v}"}
#     # end
#   end
#
# end

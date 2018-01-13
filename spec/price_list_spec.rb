# require 'price_list'
#
# describe Price_list do
#     details = {"Hamburger" => "£2.00", "Hot-dog" => "£3.00", "Fries" => "£5.00"}
#     subject(:price_list) { described_class.new(details) }
#
#     it 'should initialize with pricing details' do
#       expect(price_list.details).to eq details
#     end
#
#   describe '#show' do
#
#     it 'should respond to the show method' do
#       expect(price_list).to respond_to(:show)
#     end
#
#     it 'should call the private list method' do
#       expect(price_list.show).to eq details.each{|k, v| puts "#{k} : #{v}"}
#     end
#   end
# end

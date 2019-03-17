# Without feature test coverage hits 100%
# With feature test, despite passing all coverage drops to 89%

# require 'Customer'
# require 'menu_list'
#
# describe Takeaway do
#
#   let(:menu_list) { List.new }
#   let(:italian) { Takeaway.new }
#   let(:customer) { Customer.new("Joe Bloggs") }
#
#   context 'happy case' do
#     it 'doesnt fail' do
#       expect(italian.display).to eq ["Margherita : £6\n", "Pepperoni : £7\n",
#          "Ham & Pineapple : £7\n", "Meat feast : £8\n"]
#       expect(customer.basket).to eq 0
#       customer.add("Margherita", 2)
#       expect(customer.cost).to eq 12
#       expect(customer.basket).to eq 12
#       expect(customer.contents).to eq [{ :name => "Margherita", :price => 6, :quantity => 2 }]
#       customer.add("Ham & Pineapple", 1)
#       expect(customer.cost).to eq 19
#       expect(customer.basket).to eq 19
#       expect { customer.add("Kebab", 1) }.to raise_error
#     end
#   end
#
# end

# require 'Takeaway'
# require 'Customer'
# require 'menu_list'
#
# describe Takeaway do
#
#   let(:menu_list) { List.new }
#   let(:italian) { Takeaway.new }
#   let(:customer) { Customer.new("Joe Bloggs") }
#
#   describe '#display' do
#     it 'iterates the list' do
#       expect(italian.display).to include("Margherita : £6\n")
#     end
#   end
# end
#
# describe Customer do
#
#   let(:menu_list) { List.new }
#   let(:italian) { Takeaway.new }
#   let(:customer) { Customer.new("Joe Bloggs") }
#
#   it 'has a name when initialized' do
#     expect(customer.name).to eq 'Joe Bloggs'
#   end
#
#   describe '#add' do
#     context 'adds from menu' do
#
#       it 'adds order to our basket' do
#         customer.add("Pepperoni", 2)
#         expect(customer.contents).to eq [{ :name => "Pepperoni", :price => 7, :quantity => 2 }]
#       end
#     end
#   end
#
#   context 'adds two more to menu' do
#     it 'adds both to our basket' do
#       customer.add("Meat feast", 1)
#       customer.add("Pepperoni", 2)
#       expect(customer.contents).to eq [{ :name => "Meat feast", :price => 8, :quantity => 1 },
#       { :name => "Pepperoni", :price => 7, :quantity => 2 }]
#     end
#   end
#
#   context 'adds not from menu' do
#     it 'raises error' do
#       expect { customer.add("Kebab", 1) }.to raise_error
#     end
#   end
#
#   context 'works through happy case' do
#     it 'should not fail' do
#       italian.display
#       customer.add("Pepperoni", 7)
#       expect(customer.basket).to eq 49
#       customer.add("Meat feast", 1)
#       expect(customer.basket).to eq 57
#     end
#   end
#
# end

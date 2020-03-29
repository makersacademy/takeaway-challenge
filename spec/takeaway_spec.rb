require 'takeaway'

describe Takeaway do
    let(:customer) { Takeaway.new({ "Chicken Curry" => 6.00 }) }

it 'allows the customer to see a list of dishes' do
    expect(customer).to respond_to :print_dishes
end

it 'prints a list of dishes with the price' do
    expect {customer.print_dishes}.to output("Chicken Curry - £6.00\n").to_stdout
end
end
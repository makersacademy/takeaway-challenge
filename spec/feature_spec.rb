require 'Takeaway'
require 'Customer'
require 'menu_list'

describe Takeaway do

  let (:menu_list) {List.new}
  let (:italian) {Takeaway.new}
  let(:customer) { Customer.new("Joe Bloggs") }

  describe '#display' do
    it 'iterates the list' do
      expect(italian.display).to include("Margherita : £6\n")
    end
  end
end


describe Customer do

  let (:menu_list) {List.new}
  let (:italian) {Takeaway.new}
  let(:customer) { Customer.new("Joe Bloggs") }

  it 'has a name when initialized' do
    expect(customer.name).to eq 'Joe Bloggs'
  end

end

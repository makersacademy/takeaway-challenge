require 'Takeaway'
require 'Customer'
require 'menu_list'

describe Takeaway do

  let(:menu_list) { List.new }
  let(:italian) { Takeaway.new }
  let(:customer) { Customer.new("Joe Bloggs") }

  describe '#display' do
    it 'iterates the list' do
      expect(italian.display).to include("Margherita : £6\n")
    end
  end
end

describe Customer do

  let(:menu_list) { List.new }
  let(:italian) { Takeaway.new }
  let(:customer) { Customer.new("Joe Bloggs") }

  it 'has a name when initialized' do
    expect(customer.name).to eq 'Joe Bloggs'
  end

  describe '#add' do
    context 'adds from menu' do

      it 'adds order to our basket' do
        customer.add("Pepperoni", 2)
        expect(customer.contents).to eq [{ :name => "Pepperoni", :price => 7, :quantity => 2 }]
      end
    end
  end

  context 'adds two more to menu' do
    it 'adds both to our basket' do
      customer.add("Meat feast", 1)
      customer.add("Pepperoni", 2)
      expect(customer.contents).to eq [{ :name => "Meat feast", :price => 8, :quantity => 1 },
      { :name => "Pepperoni", :price => 7, :quantity => 2 }]
    end
  end

  context 'adds not from menu' do
    it 'raises error' do
      expect { customer.add("Kebab", 1) }.to raise_error
    end
  end

  context 'works through happy case' do
    it 'should not fail' do
      italian.display
      customer.add("Pepperoni", 7)
      expect(customer.basket).to eq 49
      customer.add("Meat feast", 1)
      expect(customer.basket).to eq 57
    end
  end

end

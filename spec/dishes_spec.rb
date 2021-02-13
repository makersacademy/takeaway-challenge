require 'dishes'

describe Dishes do
  # let(:menu) { [
  #   { item: 'Marinara', price: 7.50 },
  #   { item: 'Margherita', price: 8.95 },
  #   { item: 'Bufala DOP', price: 11.25 }] }
  # let(:my_order) { double(:Order) }

  it 'contains collection of available' do
    expect(subject).to respond_to(:dishes_list)
  end

  describe '#browse' do
    it 'prints a list of all available dishes with prices' do
      expect { subject.browse }.to output.to_stdout
    end
  end
  describe '#start_order' do
    it 'should instanciate a new order' do
      my_order = subject.start_order
      expect(my_order).to be_an_instance_of Order
    end
    # it 'should output "select your item number and desired quantity"' do
    #   message = "Enter your item number and the desired quantity"
    #   expect { subject.start_order }.to output(message).to_stdout
    # end
  end

end

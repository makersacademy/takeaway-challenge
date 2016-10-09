require 'menu'
require 'order'

describe Menu do

  describe '#initialize' do

    it 'returns an Array to represent the list of menu items' do
      expect(subject.list).to be_an_instance_of Array
    end

    it 'returns a String to represent the name of a dish' do
      expect(subject.list.first.name).to be_an_instance_of String
    end

    it 'returns a Float to represent the price of a dish' do
      expect(subject.list.first.price).to be_an_instance_of Float
    end

    # it 'adds creates an Order object' do
    #   expect(subject.order).to be_an_instance_of Order
    # end

  end
end

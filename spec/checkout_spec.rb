require 'checkout'

describe Checkout do

  let(:menu) { double(:menu) }

  describe '#check_order' do
    it 'provides the user with the total cost of their basket' do
      expect(subject.check_order([{"freaky lamp fish": 10.0}, {"freaky lamp fish": 10.0}])).to eq "Your total is £20.00!"
    end

    it 'prints the contents of the basket' do
      expect { subject.check_order([{"freaky lamp fish": 10.0}, {"freaky lamp fish": 10.0}]) }.to output.to_stdout
    end

    it 'raises an error if the basket is empty' do
      expect { subject.check_order([])}.to raise_error("Your basket is empty!")
    end

  end

  describe '#complete_order' do
    it 'raises an error if the basket is empty' do
      expect { subject.complete_order([])}.to raise_error("Your basket is empty!")
    end

  end


end

require 'dishes'

describe Dishes do
  # let(:menu) { [
  #   { item: 'Marinara', price: 7.50 },
  #   { item: 'Margherita', price: 8.95 },
  #   { item: 'Bufala DOP', price: 11.25 }] }

  it 'contains collection of available' do
    expect(subject).to respond_to(:dishes_list)
  end

  describe '#browse' do
    it 'prints a list of all available dishes with prices' do
      expect { subject.browse }.to output.to_stdout
    end
  end

end

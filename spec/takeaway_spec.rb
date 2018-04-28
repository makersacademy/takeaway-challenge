require './lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#welcome' do
    it 'should ask user if they would like to see the menu' do
      expect(takeaway.welcome).to eq 'Welcome to the chip shop!\n Would you like to see our menu?'
    end
  end
end

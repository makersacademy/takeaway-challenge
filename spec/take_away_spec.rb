require 'rspec'
require_relative '../lib/take_away'

describe TakeAway do
  subject(:take_away){described_class.new}
  describe '#new' do
    it 'should create a new take away object' do
      expect(described_class).to eq(TakeAway)
    end
  end
end
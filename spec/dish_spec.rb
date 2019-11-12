# frozen_string_literal: true

require 'dish.rb'

describe Dish do
  subject { described_class.new('pizza', 10) }
  it { is_expected.to be_an_instance_of described_class }

  describe '#name' do
    it 'returns the name of the dish' do
      expect(subject.name).to eq 'pizza'
    end
  end

  describe '#price' do
    it 'returns the price of the dish' do
      expect(subject.price).to eq 10
    end
  end
end

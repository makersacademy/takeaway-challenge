# frozen_string_literal: true

require 'order'

describe Order do
  subject { described_class.new('pizza' => 2, 'sushi' => 3) }
  it { is_expected.to be_an_instance_of described_class }

  describe '#items' do
    it 'returns a hash with order items and corresponding quantities' do
      expect(subject.items).to eq('pizza' => 2, 'sushi' => 3)
    end
  end
end

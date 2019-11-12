# frozen_string_literal: true

require 'takeaway'

describe Takeaway do
  subject { described_class.new('sample_menu.csv') }
  it { is_expected.to be_an_instance_of described_class }

  describe '#menu' do
    it 'should return an Array' do
      expect(subject.menu).to be_a(Array)
    end
  end
end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :read_menu }

  describe '#read_menu' do
    it 'let the customer read the dishes present on the menu' do

    end
  end
end

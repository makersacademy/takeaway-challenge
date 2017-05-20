require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }



  describe '#read_menu' do
    it { is_expected.to respond_to :read_menu }

    it 'let the customer read the dishes present on the menu' do
      expect(takeaway.read_menu).to eq {}
    end
  end
end

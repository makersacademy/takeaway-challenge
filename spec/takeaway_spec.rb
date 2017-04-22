require 'takeaway'

describe Takeaway do
  subject(:t) { described_class.new }

    describe '#read_menu' do
      it { is_expected.to respond_to :read_menu }

      context do
        it 'returns Brains in menu' do
          expect(t.read_menu).to include 'Brains'
        end
      end

    end
end

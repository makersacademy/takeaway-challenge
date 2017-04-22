require 'takeaway'

describe Takeaway do
  subject(:t) { described_class.new }
  let(:food) { double(:food) }

    describe '#read_menu' do
      context do
        it 'returns Brains in menu' do
          expect(t.read_menu).to include 'Brains'
        end
      end
    end

    describe '#order' do

      context 'stores multiples'
        it 'stores two of one type' do
        t.order(food, 2)
        expect(t.basket).to eq [food, food]
      end

    end
end

require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to(:show_menu) }

  it 'has an empty basket upon instantiation' do
    expect(takeaway.basket).to eq({})
  end

  describe 'Feature tests' do
    describe '#show_menu' do
      it 'shows the list of dishes with prices' do
        expect(takeaway.show_menu).to eq ({"quarter chicken": 3.5, "half chicken": 6.0, "whole chicken": 10.50, "small fries": 1.99, "large fries": 2.50})
      end
    end
  end
end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {"starter : 5\nmains : 10\ndesert : 3\n"}

  describe 'looking at a list of dishes with prices' do

    it { is_expected.to respond_to(:show_dishes) }

    it 'returns a list of dishes with price' do
    expect{takeaway.show_dishes}.to output(menu).to_stdout
    end

  end

  describe '#order' do

    it { is_expected.to respond_to(:order) }

    it 'can take multiple argument' do
      expect{takeaway.order(1, 2, 3, 4, 5, 6, 7)}.not_to raise_error
    end

  end

end

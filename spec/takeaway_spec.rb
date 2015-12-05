require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {"starter : 5\nmains : 10\ndesert : 3"}

  describe 'looking at a list of dishes with prices' do

    it { is_expected.to respond_to(:show_dishes) }

    it 'returns a list of dishes with price' do
    expect{takeaway.show_dishes}.to output(menu).to_stdout
    end

  end

end

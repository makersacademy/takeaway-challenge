require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new} #double(:text, send: nil)
  let(:menu) {"starter : 5\nmains : 10\ndesert : 3\n"}

  before do
    allow(takeaway).to receive(:text_confirmation)
  end

  describe 'looking at a list of dishes with prices' do

    it 'returns a list of dishes with price' do
    expect{takeaway.show_dishes}.to output(menu).to_stdout
    end

  end

  describe '#order' do

    it 'can take multiple arguments' do
      expect{takeaway.order("starter", 1, "mains", 2, "desert", 3, 34)}.not_to raise_error
    end

    it 'prevents a customer from ordering unavailable dishes' do
      expect{takeaway.order("steak", 1, "mains", 2, "desert", 3, 34)}.to raise_error "Unable to place order: dish not on menu"
    end

    it 'raises an error if the customer supplied total does not match the actual total' do
      expect{takeaway.order("starter", 1, "mains", 2, "desert", 3, 666)}.to raise_error "Unable to place order: supplied total doesn't match actual total"
    end


  end

end

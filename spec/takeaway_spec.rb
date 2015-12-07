require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:menu) double(:menu)

  before do
    allow(takeaway).to receive(:text_confirmation)
    allow(menu).to receive(:dishes)
  end



  describe '#order' do

    it 'can take multiple arguments' do
      expect{takeaway.order("starter", 1, "mains", 2, 25)}.not_to raise_error
    end

    it 'prevents a customer from ordering unavailable dishes' do
      message = "Unable to place order: dish not on menu"
      expect{takeaway.order("steak", 1, 34)}.to raise_error message
    end

    it 'raises error if the customer total does not match the actual total' do
      mes = "Unable to place order: total doesn't match actual total"
      expect{takeaway.order("starter", 1, 666)}.to raise_error mes
    end


  end

end

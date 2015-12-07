require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(text, menu)}
  let(:menu) {double(:menu)}
  let(:text) {double(:text)}

  before do
    allow(takeaway).to receive(:text_confirmation)
    allow(menu).to receive(:dishes)
    allow(menu).to receive(:check_all_dishes_are_on_menu)
    allow(menu).to receive(:calculate_order_total)

  end



  describe '#order' do

    it 'can take multiple arguments' do
      allow(menu).to receive(:calculate_order_total).and_return(25)
      expect{takeaway.order("starter", 1, "mains", 2, 25)}.not_to raise_error
    end



    it 'raises error if the customer total does not match the actual total' do
      mes = "Unable to place order: total doesn't match actual total"
      expect{takeaway.order("starter", 1, 666)}.to raise_error mes
    end


  end

end

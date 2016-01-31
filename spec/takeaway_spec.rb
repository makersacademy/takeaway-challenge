require 'takeaway'

RSpec.describe Takeaway do
  let(:messager) {double :messager}
  let(:menu) {double :menu, show_menu: {"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 }}


  subject(:takeaway)  {described_class.new(menu, messager)}

   before do
      allow(menu).to receive(:price_of).with("chicken").and_return(3)
      allow(menu).to receive(:price_of).with("rice").and_return(1)
      allow(menu).to receive(:price_of).with("pizza").and_return(6)
      allow(menu).to receive(:price_of).with("ham").and_return(nil)
      allow(takeaway).to receive(:send_text)
    end


    it 'sees a list of dishes with prices' do
      expect(takeaway.display_menu).to eq ({"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 })
    end

    it {is_expected.to respond_to(:select_dishes).with(2).arguments}

    it 'grows the basket after selection' do
      expect{takeaway.select_dishes('chicken', 4)}.to change{takeaway.basket.size}.by 1
    end

    it 'raises an error if the dish selected is not available' do
      expect{takeaway.select_dishes('ham', 1)}.to raise_error ""\
      "ham is not on the menu"
    end

    it {is_expected.to respond_to(:check).with(1).argument}

    it 'raises an error if the sum of dishes is not equal to total' do
      expect{takeaway.check(14)}.to raise_error 'Total does not match!'
    end

    it 'returns if correct after one selection' do
      takeaway.select_dishes("rice", 1)
      expect(takeaway.check(1)).to eq true
    end

    it 'returns if correct after more selections' do
      takeaway.select_dishes("rice", 3)
      takeaway.select_dishes("chicken", 1)
      takeaway.select_dishes("pizza", 4)
      expect(takeaway.check(30)).to eq true
    end

    it {is_expected.to respond_to(:complete_order)}

    it 'sends a message and empties the basket after complete_order' do
      takeaway.select_dishes("rice", 3)
      expect(takeaway).to receive(:send_text)
      takeaway.complete_order
      expect(takeaway.basket.size).to eq 0
    end
end

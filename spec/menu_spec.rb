require 'menu'

# Customer:
# - see list of dishes with prices **
# - select some dishes **
# - check total is correct
# - receive a text
#
# System:
# - have a Menu **
# - take an order **
# - print Menu **
# - send a text **
# - calculate total

describe Menu do

  describe '#initialize' do

    it 'has a list of dishes with prices' do
      expect(subject.dishes).not_to be_empty
    end

    it 'starts with an empty order list' do
      expect(subject.order).to be_empty
    end
  end

  describe '#print_menu' do
    it 'prints out menu' do
      expect(subject.print_menu).to eq(subject.dishes)
    end
  end

  describe '#select' do
    it { is_expected.to respond_to(:select).with(1).argument }
    it 'selects some dishes' do
      subject.select("pizza")
      subject.select("pasta")
      expect(subject.order).to eq({"pizza"=>6.0 ,"pasta"=>8.0})
    end
  end

  # describe '#send_text' do
  #   it 'sends text to customer' do
  #     expect(subject.send_text).to eq("Text sent")
  #   end
  # end

  # describe '#calculate_total' do
  #   it 'prints copy of order and total' do
  #     subject.select("Pizza")
  #     subject.select("Pasta")
  #     expect(subject.calculate_total).to eq(subject.copy)
  #   end
  # end

end

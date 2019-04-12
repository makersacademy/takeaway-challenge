require 'menu'

describe Menu do

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).not_to be_empty
    end

    it 'starts with an empty order' do
      expect(subject.order).to be_empty
    end
  end

  describe '#print_menu' do
    it 'lists the menu' do
      expect(subject.print_menu).to eq(subject.dishes)
    end
  end

  describe '#select' do
    it 'select some dishes' do
      subject.select("pizza")
      subject.select("pasta")
      expect(subject.order).to eq ["pizza", "pasta"]
    end
  end

  describe "#receipt" do
    it 'prints order summary and total' do
      subject.select("pizza")
      subject.select("pasta")
      copy_of_receipt = "pizza 6.0 \npasta 6.5 \nTotal 12.5"
      expect(subject.receipt).to eq copy_of_receipt
    end
  end
end

#   describe '#take_order' do
#     it { is_expected.to respond_to(:take_order).with(1).argument }
#
#     it 'selects some number of dishes' do
#       item = ""
#       expect(subject.take_order(item)).to include(item)
#     end
#   end

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
    it { is_expected.to respond_to(:select).with(1).argument }
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

  describe '#send_text' do
    it 'sends a text to customer' do
      expect(subject.send_text).to eq("Text sent")
	   end
	 end
end

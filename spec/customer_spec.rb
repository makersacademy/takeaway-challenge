#phone number + basket + previous baskets?
require "customer"
describe Customer do
  let(:basket){double :basket}
  let(:phone_num) {"01234567890"}
  let(:item){double :item}
  subject{described_class.new phone_num, basket}

  describe "#creation" do
    it "should have a phone number" do
      expect(subject.phone_number).to eq phone_num
    end
    it "should have a basket" do
      expect(subject.basket).to eq basket
    end
  end

  describe "#add_item" do
    it "should add items to basket" do
      allow(basket).to receive(:add)
      subject.add item
      expect(subject.basket).to have_received(:add).with(item)
    end
  end

  describe "#view_basket" do
    it "should try to print basket" do
      allow(basket).to receive(:to_s)
      subject.view_basket
      expect(subject.basket).to have_received(:to_s)
    end
  end

  describe "#finish_order" do
    it "should finish the order taking total as an arg" do
      allow(basket).to receive(:finish_order)
      total = 500
      subject.finish_order 500
      expect(subject.basket).to have_received(:finish_order).with(500,phone_num)
    end
  end

end

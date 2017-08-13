require_relative '../lib/order.rb'

RSpec.describe Order do
  it { is_expected.to be_a Order }

  let(:correct_order) { Order.new("tokyo bowl", 2, 24) }
  let(:wrong_order) { Order.new("tokyo bowl", 2, 23)}

  context "#init" do
    it "can receive an order" do
      expect(Order).to respond_to(:new).with(3).arguments
    end
    it "stores an order" do
      expect(correct_order.basket).to eq(["tokyo bowl", 2, 24])
    end
    it "contains the menu" do
      expect(subject.instance_variable_get(:@current_menu)).to be_a Hash
    end
  end

  context ".process_order" do
    it { is_expected.to respond_to :process_order }
    it "raises error if incorrect order" do
      expect { wrong_order.process_order }.to raise_error("Incorrect price entered")
    end
    it "processes correct order w/ SMS" do
      SMS = String
      expect(correct_order.process_order).to be_a SMS
    end
  end
end

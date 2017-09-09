require 'menu'

RSpec.describe Menu do

  describe "#initialize" do
    subject { described_class.new("order", "dish") }

    it "assign a value to @order_class" do
      expect(subject.order_class).to eq "order"
    end

    it "assign a value to @dish_class" do
      expect(subject.dish_class).to eq "dish"
    end
  end

end

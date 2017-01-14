require 'menu'

describe Menu do
  subject(:takeaway_menu) { described_class.new }
  let(:dish) {double :dish}
  let(:price) {double :price}

  describe "#view" do
    it {is_expected.to respond_to(:view)}

    it "is expected to return an array of dishes and prices" do
      expect(takeaway_menu.view).to be_a Array
    end

  end
end

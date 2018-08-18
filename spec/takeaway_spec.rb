describe Takeaway do

  describe "#view_menu" do

    let(:takeaway) { described_class.new }

    it "responds to this method" do
      expect(takeaway).to respond_to(:view_menu)
    end
  end


end

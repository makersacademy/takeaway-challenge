require "restaurant"

describe Restaurant do
  let(:subject) { described_class.new }
  
  it "responds to see_menu method" do
    expect(subject).to respond_to(:see_menu)
  end
  
  describe "#see_menu" do
    it "shows menu" do
      expect(subject.see_menu).to eq subject.menu
    end
  end
  
end
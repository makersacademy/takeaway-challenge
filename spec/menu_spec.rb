require 'menu'

describe Menu do
  describe "#show" do
    it "should have a show method" do
      expect(subject).to respond_to(:show)
    end
    it "should show an empty hash initially" do
      expect(subject.show).to eq({})
    end

  end
end

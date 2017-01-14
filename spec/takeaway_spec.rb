require "takeaway"

describe Takeaway do

  let(:menu) { instance_double("Menu") }

  subject(:takeaway) { described_class.new(Menu) }

  describe "#initialize" do
    it { is_expected.to respond_to(:menu) }

  end

  describe "#show_menu" do
    it { is_expected.to respond_to(:show_menu) }
  end

  describe "#place_order" do
    it { is_expected.to respond_to(:place_order) }
  end

end

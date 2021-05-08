require 'takeaway'

RSpec.describe Takeaway do
  let (:sample_menu) { "1. Fish £5.00"}

  describe '#display_menu' do
    it "displays a list of dishes with prices" do
      expect(subject.display_menu).to eq(sample_menu)
    end
  end
end
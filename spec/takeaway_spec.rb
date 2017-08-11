require_relative '../lib/takeaway.rb'
require_relative '../lib/menu.rb'

RSpec.describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:menu) { Menu }

  it { is_expected.to be_a Takeaway }

  context "#init" do
    it "initializes with menu" do
      expect(takeaway.instance_variable_get(:@menu)).to be_kind_of(menu)
    end
  end
end

require_relative '../lib/takeaway.rb'
require_relative '../lib/menu.rb'

RSpec.describe Takeaway do
  it { is_expected.to be_a Takeaway }

  let(:menu) { Menu }

  context "#init" do
    it "initializes with menu" do
      expect(subject.instance_variable_get(:@menu)).to be_kind_of(menu)
    end
  end
end

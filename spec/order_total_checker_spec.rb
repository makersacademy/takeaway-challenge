require "order_total_checker.rb"

describe OrderTotalChecker do

  subject(:ordertotalchecker) { described_class }

  describe "#check_total" do
    it { is_expected.to respond_to(:check_total).with(1).argument }
  end

end

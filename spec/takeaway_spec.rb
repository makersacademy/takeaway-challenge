require 'takeaway'

RSpec.describe Takeaway do
  it { is_expected.to respond_to(:read_menu) }
  it { is_expected.to respond_to(:order).with(2).arguments }
  it { is_expected.to respond_to(:calculate_total) }
  it { is_expected.to respond_to(:basket_summary) }
  it { is_expected.to respond_to(:basket_summary) }
  it { is_expected.to respond_to(:checkout) }

  it "can display a list of dishes with prices" do
    expect(subject.read_menu).to be_a(Hash)
  end

  it "can order any dish in various quantities" do
    subject.order('Thing1', 2)
    expect(subject.basket_summary).to include('Thing1')
  end


end
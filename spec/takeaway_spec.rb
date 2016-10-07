require "takeaway"

describe Takeaway do
  let(:takeaway) { (Takeaway.new) }


  it "shows a list of dishes with prices" do
    expect(subject.menu).to eq "Tandoori £5.00"
  end
  end

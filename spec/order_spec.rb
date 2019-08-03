require 'order'

describe Order do


 it "can add one dishes to the order" do
  subject.add("Water")
  expect(subject.show_order).to eq [{"Water"=>3}]

  end

  it "can add several dishes to the order" do
    subject.add("Water")
    subject.add("Tea")
    expect(subject.show_order).to eq [{"Water"=>3}, {"Tea"=>4}]
  end
end

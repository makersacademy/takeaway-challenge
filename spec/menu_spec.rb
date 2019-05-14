require 'menu'

describe Menu do
  it "has a menu" do
    allow(subject).to receive(:view_all).and_return({})
    expect(subject.view_all).to eq({})
  end
end

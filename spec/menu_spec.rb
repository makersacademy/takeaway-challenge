require_relative "../lib/Menu"

describe Menu do

context "When initialized" do

  it { is_expected.to respond_to(:show) }
  it { is_expected.to respond_to(:starters) }
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:show) }
  it { is_expected.to respond_to(:mains) }
  it { is_expected.to respond_to(:desserts) }
  it { is_expected.to respond_to(:drinks) }

  it "has dishes to choose from" do
    expect(subject.menu).not_to be_empty
  end

  it "can show available items" do
    expect(subject.show[0]["Soup"]).to eq ["Soup", 3.99]
  end

end

end
require_relative "../lib/Menu"

describe Menu do

context "When initialized" do

  it "has dishes to choose from" do
    expect(subject.menu).not_to be_empty
  end

  it "can show available items" do
    expect(subject).to respond_to(:show)
  end

end

end
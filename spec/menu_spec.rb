require "menu"

describe Menu do

  let(:list) { double :list }

  it "should have a list initialized" do
    expect(subject).to respond_to :list
  end
end

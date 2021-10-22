require 'menu'
require 'dish'
PRINTED_LIST = "Spaghetti:12\nMaccaroni:9\n".freeze
describe Menu do
  it "should display dishes" do
    subject = Menu.new
    expect(subject.display_dishes).to eq(PRINTED_LIST)
  end
  it "should prevent display if empty menu" do
    subject = Menu.new([])
    expect { subject.display_dishes }.to raise_error "empty menu"
  end
end

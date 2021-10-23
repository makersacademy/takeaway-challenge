require 'menu'
require 'dish'
PRINTED_LIST = "1 Spaghetti:12\n2 Maccaroni:9\n".freeze
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

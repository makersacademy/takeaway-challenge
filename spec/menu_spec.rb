require 'menu'

describe Menu do
  let(:menu) { double :menu }
  subject { described_class.new(menu) }
  it "should display the menu" do
    expect(subject.menu).to eq(menu)
  end
end

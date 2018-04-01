describe Menu do
  subject(:menu) { described_class.new }
  it "is a hash containing options" do
    expect(subject.options.class).to eq Hash
  end
end

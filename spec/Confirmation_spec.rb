require 'Confirmation'


describe Confirmation do
  subject(:confirmation) { described_class.new("+447880521694") }

  before do
    allow(confirmation).to receive(:send)
  end

  it "sends a confirmation SMS on checkout" do
    expect(confirmation).to receive(:send)
    confirmation.send
  end

end

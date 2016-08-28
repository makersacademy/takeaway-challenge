require 'main'

describe Main do

  subject(:user) {described_class.new}
  let(:options) {double :options}
  let(:italian) {class_double :italian}

  it "recognises ability to call options" do
    expect(user).to respond_to(:options)
  end
end

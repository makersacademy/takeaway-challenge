require 'message'

describe Message do

  it { is_expected.to respond_to :text }

  it "should respond with a confirmation message if it works" do
    expect(subject.text).to eq "Thank you for your order. A text message confirming the order is on its way."
  end

end

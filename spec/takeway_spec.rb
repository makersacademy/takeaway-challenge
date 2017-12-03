require_relative "../lib/takeaway"

describe TakeAway do
  subject(:takeaway) {described_class.new}

  it "should display the menu" do
    expect(subject).to respond_to(:view_menu)
  end

end

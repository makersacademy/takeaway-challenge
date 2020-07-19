require 'takeaway'

describe Takeaway do
  it 'displays a list of dishes with prices' do
    expect(subject.display_menu).to eq(subject.menu)
  end
end

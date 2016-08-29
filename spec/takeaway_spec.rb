require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  it 'shows a list of available dishes' do
    expect(takeaway.show_menu).to include ({"chips" => 2})
  end

  it 'raises an error if a dish is not available' do
    msg = 'That dish is not available'
    expect{takeaway.add("rice",2)}.to raise_error msg
  end

  it 'adds dishes to selected dishes' do
    takeaway.add("chips",2)
    msg = "Your selected dishes are {\"chips\"=>2}"
    expect(takeaway.view_order).to eq msg

  end

end

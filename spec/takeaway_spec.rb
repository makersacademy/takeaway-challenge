require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  it 'shows a list of available dishes' do
    expect(takeaway.show_menu).to include ({"chips" => 2})
  end

end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  it 'return list of dishes with pricea' do
    expect(takeaway.see_menu).to be_an_instance_of(Array)
  end

end
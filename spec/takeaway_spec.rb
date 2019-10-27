require 'takeaway'

describe Takeaway do
  let(:subject) { Takeaway.new }

  it 'has a menu on initialization' do
    expect(subject.menu).to be_a(Menu)
  end
end

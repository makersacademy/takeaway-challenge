require 'takeaway'

describe Takeaway do
  subject { described_class.new }

  it 'should respond to see_menu method' do
    expect(subject).to respond_to(:see_menu)
  end
end

require 'takeaway'

describe Takeaway do
  it 'instantiates a Takeaway class' do
    expect(subject).to be_a_kind_of Takeaway
  end

  describe '#menu' do
    it 'prints out the menu itmes and their prices' do
      expect(subject.menu).to include("tacos" => 5)
    end
  end
end

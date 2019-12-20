require 'takeaway'

describe Takeaway do
  it 'has an empty order' do
    expect(subject.order).to be_empty
  end

    it 'respond to menu' do
      expect(subject).to respond_to(:menu)
    end

end

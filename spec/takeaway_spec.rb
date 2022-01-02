require 'takeaway'

describe Takeaway do
  subject (:takeaway) { Takeaway.new }

  it 'is a takeaway' do
    expect(takeaway).to be_a Takeaway
  end

  describe 'initialisation' do
    it 'has a menu' do
      expect(takeaway.menu).to be_a Menu
    end
  end
end

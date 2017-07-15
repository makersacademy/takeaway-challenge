require 'order'

describe Order do

  numbers = [1,2,3,4]
  subject(:order) { described_class.new(numbers) }

  describe'#initialize' do

    it 'creates a new menu selection' do
      expect(subject.order).not_to be_nil
    end
  end

end

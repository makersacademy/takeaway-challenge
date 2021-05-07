require 'dishes'

describe Dishes do
  context '.list' do
    it 'checks if dishes can respond to the method of list' do
      expect(subject).to respond_to :list_dishes
    end
  end
end

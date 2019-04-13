require 'takeaway'

describe Takeaway do
  context 'to check if I want to order something' do
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to be_an Array
    end
  end
end

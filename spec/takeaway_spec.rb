require 'takeaway.rb'

describe Takeaway_menu do 
  context 'I want to order something' do
    it 'shows a list of items avalible with prices' do
      expect(subject.menu).to be_an Array
    end
  end
end 
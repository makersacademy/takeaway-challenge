require 'order.rb'

describe Order do

  context '#view_menu' do
    it 'is not empty' do
      expect(subject.view_menu).not_to be_empty
    end
  end
end

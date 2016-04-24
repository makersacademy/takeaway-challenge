require 'menu'

describe Diner do

  context '#print_items' do
    it 'prints out the menu items' do
      expect(subject).to respond_to(:print_items)
    end
  end

end

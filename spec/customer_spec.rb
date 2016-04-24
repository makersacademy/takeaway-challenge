require 'customer'

describe Customer do

  context '#view_menu' do
    it 'is able to view the menu' do
      expect(subject).to respond_to(:view_menu)
    end
  end

  context '#order_items' do
    xit do
      
    end
  end

end

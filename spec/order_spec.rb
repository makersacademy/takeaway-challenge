require 'order'

describe Order do 
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:menu) }

  describe ' #view' do 
    it 'should be able to view the menu' do 
      expect(menu.view).to be_a(Hash)
    end 
  end 

  # describe ' #add_item' do 
  #   it 'should be an empty hash' do 
  #     expect { order.add_item(padthai, 1) }.to change{order.order}.by(1)
  #   end 
  # end 
end 
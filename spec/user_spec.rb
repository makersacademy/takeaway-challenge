require 'user'

describe User do

  subject(:user) { described_class.new(menu) }
  let(:menu) { double :menu }
  
  describe '#list_dishes' do
    
    it 'responds to list_dishes' do
      expect(user).to respond_to(:list_dishes)
    end
    
    it 'lists available dishes with prices' do
      expect(user.list_dishes).to eq(menu)
    end
    
  end
  
end
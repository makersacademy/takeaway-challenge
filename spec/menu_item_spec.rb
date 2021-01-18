require 'menu_item'

describe Menu_Item do
=begin
  describe '#initialize' do
     it { is_expected.to respond_to :name }
     it { is_expected.to respond_to :description }
     it { is_expected.to respond_to :price }

     it 'should have default values if none are supplied' do
       expect(subject.name).to eq Menu_Item::DEFAULT_NAME
       expect(subject.description).to eq Menu_Item::DEFAULT_DESCRIPTION
       expect(subject.price).to eq Menu_Item::DEFAULT_PRICE
     end
  end
=end
end

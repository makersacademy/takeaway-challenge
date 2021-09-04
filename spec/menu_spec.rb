require 'menu'
require 'dish'

describe Menu do
 it { is_expected.to be_kind_of(described_class) }
 it { is_expected.to respond_to(:list_menu) }

 it 'has a #list of dishes' do
  dish = Dish.new
  subject.list_menu
  expect(subject.list_of_dishes).to eq([dish.hash])
 end
end

require 'menu'

describe Menu do
  let(:item) { double:item }
  let(:price) { double:price }

  it 'expects menu to contain a list of food' do
    expect(subject.menu_list[0]).to eq nil
  end

  # it 'allows to add meals to list' do
  #
  # end
  #
  it' allows access to price by using meal name as key' do
    subject.add_meal(:item, :price)
    expect(subject.menu_list[:item]).to be (:price)
  end
end

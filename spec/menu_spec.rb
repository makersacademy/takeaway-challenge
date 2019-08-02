require 'menu'
require 'item_list'


describe Menu do

  it_behaves_like ItemList

  let(:dish) {double(:dish,change_cost: 0,name: "Swordfish",cost: 5, change_cost: 7)}

  it 'displays an empty dish' do
    expect(subject.display).to eq("\n")
    expect{subject.display}.to output("\n").to_stdout
  end

  context 'with added dish' do
    before(:each) {subject.add_item(dish)}

    it 'displays the dish' do
      expect{subject.display}.to output(/Swordfish/).to_stdout
    end


    it 'can alter a dish based on name' do
      dish2 = double(:dish2 ,name: "Swordfish" ,cost: 2)
      expect(dish).to receive(:alter).with(dish2)
      subject.alter_item(dish2)
      expect(subject.items.last).to eq(dish)
    end

  end


  pending 'loads menu from a file'

end
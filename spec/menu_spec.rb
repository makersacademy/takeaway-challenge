require 'menu'



describe Menu do
  let(:dish) {double(:dish,change_cost: 0,name: "Swordfish",cost: 5, change_cost: 7)}

  it 'starts with no dishes' do
    expect(subject.items).to eq([])
      # expect{subject.display}.to output("\n").to_stdout
      expect(subject.display).to eq("\n")
  end

  it 'appends a dish to menu' do
    expect{subject.add_item(dish)}.to change{subject.items.count}.by(1)
    expect(subject.items.last).to eq(dish)
  end

  it 'cannot remove n item which isn\'t there' do
    expect{subject.remove_item(dish)}.to raise_error(Menu::ERR_MISSING_ITEM)
  end

  context 'with added dish' do
    before(:each) {subject.add_item(dish)}

    it 'displays the dish' do
      expect{subject.display}.to output(/Swordfish/).to_stdout
    end

    it 'cannot add the same dish twice' do
      expect{subject.add_item(dish)}.to raise_error(Menu::ERR_DUPLICATE_ITEM)
    end

    it 'can remove an item' do
      expect{subject.remove_item(dish)}.to change{subject.items.count}.by(-1)
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
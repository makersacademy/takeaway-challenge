shared_examples_for ItemList do

  let(:dish) {double(:dish,change_cost: 0,name: "Swordfish",cost: 5)}

  it 'starts with no items' do
    expect(subject.items).to eq([])
      # expect{subject.display}.to output("\n").to_stdout
      # expect(subject.display).to eq("\n")
  end

  it 'appends an item to list' do
    expect{subject.add_item(dish)}.to change{subject.items.count}.by(1)
    expect(subject.items.last).to eq(dish)
  end

  it 'cannot remove n item which isn\'t there' do
    expect{subject.remove_item(dish)}.to raise_error(Menu::ERR_MISSING_ITEM)
  end

  context 'with added dish' do
    before(:each) {subject.add_item(dish)}

    it 'cannot add the same dish twice' do
      expect{subject.add_item(dish)}.to raise_error(Menu::ERR_DUPLICATE_ITEM)
    end

    it 'can remove an item' do
      expect{subject.remove_item(dish)}.to change{subject.items.count}.by(-1)
    end

  end

end

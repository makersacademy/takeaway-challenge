require 'menu'

RSpec.describe Menu do
let(:subject) { Menu.new('Rodriguez')}

  it 'has zero dishes' do 
    expect(subject.dishes.length).not_to be_zero
  end

  it 'has a name' do
    expect(subject.name).to eq('Rodriguez')
  end

  it 'can view the menu' do 
    expect(subject.view).to include('Spaghetti', 'Pizza')
  end

  it 'can select an item' do
    expect(subject.select("pizza").length).to eq(2)
  end
end

require 'menu'

RSpec.describe Menu do
let(:subject) { Menu.new('Rodriguez')}

  it 'has zero dishes' do 
    expect(subject.dishes.length).not_to be_zero
  end

  it 'has a name' do
    expect(subject.name).to eq('Rodriguez')
  end

  it 'welcomes the user to the restaurant app' do 
    expect(subject.welcome).to eq("Welcome to Rodriguez! Would you like to view our menu?")
  end

  it 'can view the menu' do 
    expect(subject.view_menu).to include('Spaghetti', 'Pizza')
  end
end

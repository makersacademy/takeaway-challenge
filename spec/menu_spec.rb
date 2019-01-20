require 'menu.rb'

RSpec.describe Menu do
  let(:subject){ Menu.new }
  let(:dishes){{
    'pizza' => 9.99,
    'calzone' => 11.50,
    'kebab' => 4.99,
    'soup' => 5.50,
    'sandwich' => 3.50,
    'garlic bread' => 3.99
  }}
  it 'initializes a list of #dishes' do
    expect(subject.dishes).not_to be_empty
  end
  it 'stores dishes with prices' do
    expect(subject.dishes).to eq dishes
  end
  describe '#add_dishes' do
    it 'adds a new dish' do
      subject.add_dishes('lasagna', 8)
      expect(subject.add_dishes('lasagna', 8)).to include('lasagna' => 8)
    end
  end
  describe '#print_menu' do
    it 'prints the menu' do
      subject.print_menu
      expect(subject.print_menu).to eq dishes
    end
  end
end

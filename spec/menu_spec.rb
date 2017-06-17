require 'menu'

describe Menu do

  let(:dishes) do
    { 'Kobe Slider' => 7,
      'Shrimp Tempura'=> 4,
      'Salmon Teriyaki' => 5,
      'Chicken Katsu' => 8,
      'Edamame' => 2 }
  end

  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'initializes with the list of dishes' do
      expect(menu.dishes).to eq dishes
    end
  end


  describe '#read_menu' do
    it { is_expected.to respond_to(:read_menu) }

    it 'outputs the menu' do
      expect { menu.read_menu }.to output(@dishes).to_stdout
    end
  end
end

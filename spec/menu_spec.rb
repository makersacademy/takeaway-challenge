require 'menu'

describe Menu do

  context "#print_menu" do
    it 'will print a list of menu items' do
      hash = {"Chicken" => 3.50, "Burrito" => 4.0, "Fish" => 5.0}
      expect(subject.print_menu).to eq hash
    end
  end

end

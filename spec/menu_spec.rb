require './lib/menu'

describe Menu do

  let(:subject) { Menu.new(nil)}

  describe '#initialize' do
    it 'initializes with the menu' do
      expect(subject.menu).to include('Hallumi fritter burger' => 8)
    end
  end 
  
  describe '#list_dishes' do
    it 'returns list of all dishes prices' do
      expect(subject.menu).to eq Menu::MENU
    end
  end

end

# I needed help with this. Hash kept outputting nil. This really confussed me 
# 1) Menu#dispaly_menu #displays menu
# Failure/Error: expect(subject.display_menu).to include('Beef burger' => 12)

#   expected [nil, nil, nil, nil, nil, nil, nil, nil] to include {"Beef burger" => 12}
#   Diff:
#   @@ -1 +1 @@
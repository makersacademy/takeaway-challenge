require 'Menu'

describe Menu do
    #### change so this states behaviour over state. ####
  it "displays a hash of menu items on initialization(initialize)" do
    expect(subject.dishes).to eq({ "pizza" => 1, "pasta" => 2 })
  end

  it "displays the menu(display_menu)" do
    expect(subject.display_menu).to eq({ "pizza" => 1, "pasta" => 2 })
  end 
    
end

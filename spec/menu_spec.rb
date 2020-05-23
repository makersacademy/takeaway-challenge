require 'Menu'

describe Menu do
    #### change so this states behaviour over state. ####
  it "displays a hash of menu items on initialization" do
    expect(subject.dishes).to eq({ "pizza" => 1, "pasta" => 2 })
  end
    
end

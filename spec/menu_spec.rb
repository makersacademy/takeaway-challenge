require 'menu'

describe Menu do

  let(:menu) { double(:menu) }

  it 'responds to get_menu' do
    expect(subject).to respond_to(:print_menu)
  end

  it 'responds to total' do
    expect(subject).to respond_to(:total).with(1).argument
  end

  it "has items hash on initialization" do
    expect(subject.items).to eq({
      "Biryani" => 9, "Korma" => 9, "Tikka Masala" => 7, "Set meal 1" => 25, 
      "Naan" => 3, "Pilau rice" => 3, "Poppadom" => 2, 
      "Cake" => 3, "Soft drinks" => 1 
    })
  end

  context "print_menu" do
  
    it "puts menu to console" do
      expect(subject.print_menu).to eq({ "Biryani" => 9, "Korma" => 9, "Tikka Masala" => 7, "Set meal 1" => 25, "Naan" => 3, "Pilau rice" => 3, "Poppadom" => 2, "Cake" => 3, "Soft drinks" => 1 })
    end

    it "returns items hash" do
      expect(subject.print_menu).to eq({ "Biryani" => 9, "Korma" => 9, "Tikka Masala" => 7, "Set meal 1" => 25, "Naan" => 3, "Pilau rice" => 3, "Poppadom" => 2, "Cake" => 3, "Soft drinks" => 1 })
    end

  end
end

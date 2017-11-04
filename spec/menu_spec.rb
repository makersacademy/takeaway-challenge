require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#read_menu prints out food and prices' do
      information = "Satay, $5\nRotiCanai, $9\nKuih, $3\nNasiLemak, $10\n"
      expect{subject.read_menu}.to output(information).to_stdout
    end
  end

context 'order food from menu' do

  it '#order will allow user to order food' do
    expect(subject.order("Satay")).to eq("You have added Satay to your basket")
  end

  it '#order will block orders that are not from menu' do
    expect(subject.order("Potatoe")).to eq("This is Malaysian restaurant. We don't have that")
  end
  
end


end

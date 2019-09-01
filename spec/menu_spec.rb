require 'menu'

describe Menu do

  context '#initialize' do 
    it 'expects menu to initialise with the menu' do
      message = { "Daniels's Delicious Chicken" => 12, "Eduard's Enviable Eggs" => 19, "Mark's Marvellous Lasagne" => 8,
      "Gabriel's Godly Fries" => 25, "Maria's Majestic Meatballs" => 24, "Rafaela's Round Halloumi" => 39,
      "Sayem's Saucy Fishcakes" => 22, "Valeria's Value Milkshake" => 16
     }
      expect(subject.items).to eq message
    end
  end

  context '#display' do
    it 'expects the display function to display the menu' do
        message = "1. Daniels's Delicious Chicken £12\n2. Eduard's Enviable Eggs £19\n3. Mark's Marvellous Lasagne £8\n4. Gabriel's Godly Fries £25\n5. Maria's Majestic Meatballs £24\n6. Rafaela's Round Halloumi £39\n7. Sayem's Saucy Fishcakes £22\n8. Valeria's Value Milkshake £16\n"
        expect { subject.display }.to output(message).to_stdout
    end
  end
end

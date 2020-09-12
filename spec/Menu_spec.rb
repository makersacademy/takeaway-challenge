require 'Menu'

describe Menu do
 
    it 'print a list of dishes' do
    dishes = {
            "Cassoulet" => 11,
            "Pan Bagnat" => 9,
            "Pasta arrabiatta" => 10
            }
      expect(subject.print).to eq(dishes)
    end

    it 'print a selected dish price' do
     expect(subject.price("Cassoulet")).to eq 11
    end
end
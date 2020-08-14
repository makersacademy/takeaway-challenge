require "menu"

describe Menu do
   it "create list with stored hashes as menu" do 
      subject.menu << {"pizza" => 12}
      expect(subject.menu[-1].values).to eq [12]
   end
end
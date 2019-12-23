require 'menu'

describe Menu do 
    describe "#menu" do
      it 'stores a list of dishes with prices' do
        expect(subject.menu).to eq( { :pizza => 6, :burger => 5, :chicken => 4, :chips => 3 } )
      end
    end
end
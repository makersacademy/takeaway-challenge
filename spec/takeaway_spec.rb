require 'takeaway'

describe Restaurant do
    let(:menu) {double(:menu)}
    describe '#initialize' do 
      it 'checks existance of the menu' do 
          expect(subject.menu).to be_an_instance_of(Hash)
      end 

      it 'expects to print menu' do
         expect {subject.menu_print}.to output.to_stdout
      end  

    end 
    describe '#order' do 
      it 'creats an epmty array' do
          expect(subject.order).to eq []
      end

      it 'adds chosen items to the order' do
          expect(subject).to respond_to(:add_item).with(1).argument
      end 

      it 'returns true if item is on the menu' do 
         expect(subject.include?(:'burger')).to eq true 
      end 

      it 'returns price of the item on the menu' do
         expect(subject.price(:'burger')).to eq 5
      end
    end

end 

 
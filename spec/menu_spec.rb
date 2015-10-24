require 'menu'



describe Menu do

  describe '#initialize' do
    it { is_expected.to respond_to :list_of_dishes }

  	it 'is expected to have a list of dishes and prices' do
  		expect(subject.list_of_dishes).to include "salad" => 4
  	end
  end

  describe '#list' do
  	it { is_expected.to respond_to :list }
  end

  describe '#dish_name' do
  	it 'returns an array of name keys' do
  		expect(subject.dish_name).to_not be_empty
  	end
  	it 'includes a key' do
  		expect(subject.dish_name).to include "salad"
    end
  end

end
require 'menu'
require 'order'

describe Menu do

  context '#initialize' do

    it { is_expected.to respond_to :list_of_dishes }

    it 'should respond with a hash of dishses' do
      expect(subject.list_of_dishes).to include("margherita" => 9, "pepperoni" => 10, "americano" => 11)
    end

  end

end

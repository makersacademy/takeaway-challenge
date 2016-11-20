require 'menu'

describe Menu do

  context '#initialize' do

    it {is_expected.to respond_to :list_of_dishes}

    it 'should respond with a hash' do
      expect(subject.list_of_dishes).to include("margherita" => 9)
    end

  end

end

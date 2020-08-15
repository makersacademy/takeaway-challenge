require 'menu'

describe Menu do

	let(:menu) { double :menu }
	let(:dishes){ { salmon: salmon } }

	it 'successfully creates instance of class' do
		expect(subject).to be_instance_of(Menu)
	end

  it 'responds to method of dishes' do
  	expect(subject).to respond_to(:dishes)
  end

  describe 'dishes' do

  	it 'includes salmon in dish list' do
  		expect(subject.dishes).to have_key(:salmon)
  	end

  end


	
	
end
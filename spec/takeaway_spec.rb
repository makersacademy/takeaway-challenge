require 'takeaway'

describe Takeaway do

	it 'basic instance creation' do
		expect(subject).to be_instance_of(Takeaway)
	end

  it 'responds to menu inst var' do
  	expect(subject).to respond_to(:menu)
  end

  it 'responds to start method' do
  	expect(subject).to respond_to(:place_order)
  end

  #describe 'start_order' do
  #  it 'can place order' do
  #    expect(subject.start_order(:dishes)).to eq()
  #  end
  #end

  it 'responds to finish method' do
  	expect(subject).to respond_to(:finish_order)
  end

  it 'responds to finish method' do
    expect(subject).to respond_to(:print_menu)
  end


  describe 'print_menu' do

    it 'returns a list of dishes when called' do
      choose = Menu.new
      expect(subject.print_menu).to eq(choose.avail_dishes)
    end

  end







end
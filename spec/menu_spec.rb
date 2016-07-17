require 'menu'

describe Menu do
  it{is_expected.to respond_to :starters}

describe '#initialize' do
  subject {Menu.new}
  context 'when menu is created' do
    it 'creats a new starters instance' do
      expect(subject.starters).to be_instance_of(Starters)
    end
  end

  context 'when menu is created' do
    it 'creats a new starters instance' do
      expect(subject.main_course).to be_instance_of(MainCourse)
    end
  end
end




  #  it 'holds a list of starters and prices in a hash' do
  #    puts "=================#{subject.starters}================"
  #    expect(subject.starters).to include("TomKaKai", "£6.50")
  #  end
  #end
#
  #context 'when menu is created' do
  #  it 'holds a list of main courses and prices in a hash' do
  #    puts "=================#{subject.main_course}================"
  #    expect(subject.main_course).to include(PhadThai: "£9.50")
  #  end
  #end

#end
end

require 'menu'

describe Menu do
  it{is_expected.to respond_to :starters}
  it{is_expected.to respond_to :starters_list}
  it{is_expected.to respond_to :main_course}
  it{is_expected.to respond_to :main_course_list}
  it{is_expected.to respond_to :create_starters_list}
  it{is_expected.to respond_to :create_full_menu}

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

  context 'when menu is created' do
    it 'creats a new starters list' do
      @new_starters = Starters.new
      allow(@new_starters).to receive(:list).and_return({"SpringRolls" => 4.0})
      expect(subject.starters_list).to include(@new_starters.list)
    end

    it 'creats a new main course list' do
      @new_main_course = MainCourse.new
      allow(@new_main_course).to receive(:list).and_return({"PhadThai" => 9.5})
      expect(subject.main_course_list).to include(@new_main_course.list)
    end
  end

end

end

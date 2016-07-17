require 'main_courses'

describe MainCourse do
  it {is_expected.to respond_to :main_course_list}

  describe '#initialize' do
    subject {MainCourse.new}
      context 'when starters are created' do
        it 'holds a list of main courses and prices in a hash' do
          subject.list
          puts "=================#{subject.main_course_list}================"
          expect(subject.main_course_list).to include("PhadThai" => "£9.50")
        end
        end
  end
end

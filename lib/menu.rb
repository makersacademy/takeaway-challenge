require 'csv'
class Menu

attr_accessor :starters
attr_accessor :main_course

  def initialize
    @starters = Starters.new
    @main_course = MainCourse.new
  end


  def print_starters
    int = 0
    until int == starters.list.count
      puts "#{starters.list.keys[int]} ---> #{starters.list.values[int]} ".center(500)
      int += 1
    end
  end

  def print_main_courses
    int = 0
    until int == main_course.main_course_list.count
      puts "#{main_course.main_course_list.keys[int]} ---> #{main_course.main_course_list.values[int]} ".center(500)
      int += 1
    end
  end


end

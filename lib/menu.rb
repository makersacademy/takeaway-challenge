require 'csv'
require_relative 'starters'
require_relative 'main_courses'
class Menu

attr_accessor :starters,:starters_list, :main_course, :main_course_list

  def initialize
    @starters = Starters.new
    @main_course = MainCourse.new
    self.create_starters_list
    self.create_main_course_list
  end

  def create_starters_list
    @starters_list = @starters.starters
  end

  def create_main_course_list
    @main_course_list = @main_course.main_course
  end

  def print_starters
    int = 0
    until int == starters_list.count
      puts "#{int + 1}. #{starters_list[int].keys[0]} ---> £#{starters_list[int].values[0]} ".center(500)
      int += 1
    end
  end

  def print_main_courses
    int = 0
    until int == main_course_list.count
      puts "#{int + (starters_list.count + 1)}. #{main_course_list[int].keys[0]} ---> £#{main_course_list[int].values[0]} ".center(500)
      int += 1
    end
  end


end

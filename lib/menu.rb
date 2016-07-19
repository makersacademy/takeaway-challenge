require 'csv'
require_relative 'starters'
require_relative 'main_courses'
class Menu

attr_accessor :starters,:starters_list, :main_course, :main_course_list, :full_menu

  def initialize
    @starters = Starters.new
    @main_course = MainCourse.new
    self.create_starters_list
    self.create_main_course_list
    self.create_full_menu
  end

  def create_starters_list
    @starters_list = @starters.starters
  end

  def create_main_course_list
    @main_course_list = @main_course.main_course
  end

  def create_full_menu
    @full_menu = @starters_list.merge(@main_course_list)
  end

  def print_starters
    int = 0
    @starters_list.each do |dish, value|
      puts "#{int + 1}. #{dish} ---> £#{value} ".center(500)
      int += 1
    end
  end

  def print_main_courses
    int = 0
    @main_course_list.each do |dish, value|
      puts "#{int + (starters_list.count + 1)}. #{dish} ---> £#{value} ".center(500)
      int += 1
    end
  end


end

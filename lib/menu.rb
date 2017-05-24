class Menu
  attr_reader :menu

# TODO remove this menu
  def initialize
    @menu = { :starters => starters(),
              :main_course => main_course(),
              :dessert => dessert() }
  end

  def starters
    { 1 => { "Olives" => 4 }, 2 => { "Pitta bread" => 5 } }
  end

  def main_course
    { 3 => { "Fried duck" => 12 }, 4 => { "Fish & Chips" => 9 } }
  end

  def dessert
    { 5 => { "Jam roll" => 5 }, 6 => { "Apple crumble" => 6 } }
  end

# TODO this is duplicated from
  def extracts_starters
    extracts(starters(), [1, 2], "Starters")
  end

  def extracts_main_course
    extracts(main_course(), [3, 4], "Main Courses")
  end

  def extracts_dessert
    extracts(dessert(), [5, 6], "Desserts")
  end

  def extracts(course, numbers, description)
    course1 = course[numbers[0]].map { |k, v| "#{k} = £#{v}" }.join(', ')
    course2 = course[numbers[1]].map { |k, v| "#{k} = £#{v}" }.join(', ')
    course1_key = course.keys[0]
    course2_key = course.keys[1]
    print "#{description}: #{course1_key}. #{course1}, #{course2_key}. #{course2} "
  end

end

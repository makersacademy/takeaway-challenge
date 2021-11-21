require_relative './menu'
require_relative './dish'
require_relative './database_connection'

class MenuData
  def initialize(dishes = [])
    @dishes = dishes
  end

  def self.save(dishes)
    dishes.each { |dish| add(dish) }
  end

  def self.add(dish)
    DatabaseConnection.query("INSERT INTO menu (description,price) VALUES('#{dish.description}',#{dish.price})")
  end

  def self.fetch_menu
    result = DatabaseConnection.query('SELECT * FROM menu ORDER BY price DESC;')
    result.map { |dish| Dish.new(dish['description'], dish['price']) }
  end

  def self.delete_table
    DatabaseConnection.query('DROP TABLE IF EXISTS menu;')
  end

  def self.create_table
    DatabaseConnection.query(
    'CREATE TABLE menu(dish_id SERIAL PRIMARY KEY,description VARCHAR(60),price INT);'
    )
  end

  def self.truncate_table
    DatabaseConnection.query(
      'TRUNCATE menu RESTART IDENTITY CASCADE;'
    )
  end

end
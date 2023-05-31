require 'sqlite3'

class Dog
  attr_accessor :name, :age, :breed

  def self.create_table
    database = SQLite3::Database.new("dogs.db")
    database.execute <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER,
        breed TEXT
      );
    SQL
    puts "Table created successfully!"
  end
end
Dog.create_table

def self.drop_table
    database = SQLite3::Database.new("dogs.db")
    database.execute("DROP TABLE IF EXISTS dogs;")
    puts "Table dropped successfully!"
end
Dog.drop_table
  def save
    database = SQLite3::Database.new("dogs.db")
    database.execute("INSERT INTO dogs (name, age, breed) VALUES (?, ?, ?)", [@name, @age, @breed])
    puts "Record saved successfully!"
    self
  end
end
end

dog = Dog.new("Teddy", 3, "cockapoo")
 
def self.create(name, age, breed)
    dog = Dog.new(name, age, breed)
    dog.save
  end
end

new_dog = Dog.create("Teddy", 3, "cockapoo")
puts "New dog's name: #{new_dog.name}"
puts "New dog's age: #{new_dog.age}"
puts "New dog's breed: #{new_dog.breed}"

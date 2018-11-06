class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize name, grade, id=nil
    @name, @grade, @id = name, grade, id
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    grade TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL 
    DROP TABLE students
    SQL

    DB[:con].execute(sql)
  end

end

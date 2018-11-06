class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize name, grade, id=nil
    @name, @grade, @id = name, grade, id
  end

  def self.create_table
    sql = <<-SQL CREAT TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    grade TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end

end

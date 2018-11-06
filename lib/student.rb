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

    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
    INSERT INTO students (name,grade) VALUES (?,?)
    SQL

    DB[:conn].execute(sql,name, grade)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

  def self.create name:, grade:
    student = new(name, grade)
    student.save
    student
  end

end

# List out all students
# Find specific student

class Student

  attr_accessor :name

###attr_accesor creates the following code FOR YOU !

# def name
#     @name     ## only this code runs if we use attr_reader
#   end
# def name=(other)
#   @name = other  ## only this code gets done if we want only attr_writer as it sets new value bye writing
# end

  @@students = [] #empty array which we will fill with objects

  # def self.find_by_name(name)
  #   @@students.each do |student|
  #     if student.name == name
  #       return student
  #     end
  #   end
  # end

  def self.find_by_name(name)
    @@studnets.find{|student|student.name == name}
  end

  def self.all
    @@students

  end
  def initialize(name)
    @name = name
    @@students << self
  end

end

Student.new("Astrid")
Student.new "Jarod"
Student.new "Kevin"
Student.new "thanh"
Student.new "Bharvi

Student.find_by_name("Bharvi")

puts Student.all

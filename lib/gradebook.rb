class Gradebook
  attr_reader :instructor,
              :courses
  def initialize(instructor, *courses)
    @instructor = instructor
    @courses = courses
  end
  
  def students_enrolled
    students = []
    @courses.each do |course|
      students << course.students
      students.flatten!
    end
    students.uniq
  end
  
  def grades_below(num)
    below = []
    @courses.map do |course|
      course.students.each do |student|
        student.total 
        if student.total < num
          below << student
          below.flatten!
        end
        # require 'pry'; binding.pry
        # below << (num > student.grade)
      end
      below
    end
    # require 'pry'; binding.pry
  end
  
end
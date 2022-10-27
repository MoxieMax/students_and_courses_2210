class Student
  attr_reader :name,
              :age,
              :scores
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @age = attributes.fetch(:age)
    @scores = []
  end
  
  def log_score(score)
    @scores << score
  end
  
  def grade
    @scores.sum.to_f / @scores.count
  end
end
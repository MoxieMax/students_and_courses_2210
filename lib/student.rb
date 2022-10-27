class Student
  attr_reader :name,
              :age,
              :scores,
              :total
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @age = attributes.fetch(:age)
    @scores = []
    @total = nil
  end
  
  def log_score(score)
    @scores << score
  end
  
  def grade
    @total = (@scores.sum.to_f / @scores.count)
  end
end
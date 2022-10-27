require './lib/student'
require './lib/student'

RSpec.describe Course do
  describe 'iteration 2' do
    let(:course) {Course.new("Calculus", 2)}
    let(:student1) {Student.new({name: "Morgan", age: 21})}
    let(:student2) {Student.new({name: "Jordan", age: 29})}
    
    it 'exists' do
      expect(course).to be_a(Course)
    end
    
    it 'has redable attributes' do
      expect(course.name).to eq("Calculus")
      expect(course.capacity).to eq(2)
      expect(course.students).to eq([])
    end
    
    it 'can determine if the course is full' do
      expect(course.full?).to eq(false)
      course.enroll(student1)
      course.enroll(student2)
      expect(course.full?).to eq(true)
    end
  end
end
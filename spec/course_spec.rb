require 'pry'
require './lib/student'
require './lib/course'

RSpec.describe Course do
  describe 'iteration 2' do
    let(:course) {Course.new("Calculus", 2)}
    let(:student1) {Student.new({name: "Morgan", age: 21})}
    let(:student2) {Student.new({name: "Jordan", age: 29})}
    let(:student3) {Student.new({name: 'Kali', age: 25})}
    
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
      
      expect(course.students).to eq([student1, student2])
      expect(course.full?).to eq(true)
    end
    
    it 'will not add students once the course is full' do
      course.enroll(student1)
      course.enroll(student2)
      course.enroll(student3)
      expect(course.students).to eq([student1, student2])
    end
  end
end
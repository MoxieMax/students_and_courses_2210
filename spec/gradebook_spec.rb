require 'pry'
require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  describe 'iteration 3' do
    let(:gradebook) {Gradebook.new('Miguel', course1, course2)}
    let(:course1) {Course.new('Calculus', 2)}
    let(:course2) {Course.new('Horror Film & Lit', 4)}
    let(:student1) {Student.new({name: 'Morgan', age: 21})}
    let(:student2) {Student.new({name: 'Jordan', age: 29})}
    let(:student3) {Student.new({name: 'Kali', age: 25})}
    let(:student4) {Student.new({name: 'Rohan', age: 18})}
    
    it 'exists' do
      expect(gradebook).to be_a(Gradebook)
    end
    
    it 'has readable attributes' do
      expect(gradebook.instructor).to eq('Miguel')
      expect(gradebook.courses).to eq([course1, course2])
    end
    
    it 'can list students in courses' do
      course1.enroll(student1)
      expect(gradebook.students_enrolled).to eq([student1])
      
      course1.enroll(student2)
      expect(gradebook.students_enrolled).to eq([student1, student2])
      
      course2.enroll(student3)
      course2.enroll(student4)
      
      expect(gradebook.students_enrolled).to eq([student1, student2, student3, student4])
    end
    
    it 'can return students with grades below a certain threshold' do
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student1)
      course2.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)
      
      student1.log_score(89)
      student1.log_score(78)
      student2.log_score(88)
      student2.log_score(90)
      student3.log_score(52)
      student3.log_score(65)
      student4.log_score(78)
      student4.log_score(92)
      
      expect(student1.grade).to eq(83.5)
      expect(student2.grade).to eq(89.0)
      expect(student3.grade).to eq(58.5)
      expect(student4.grade).to eq(85.0)
      # binding.pry
      expect(gradebook.grades_below(80.0)).to eq([student3])
      
    end
  end
end
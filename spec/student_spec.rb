require './lib/student'

RSpec.describe Student do
  
  describe 'iteration 1' do
    let(:student) {Student.new({name: "Morgan", age: 21})}
    
    it 'exists' do
      expect(student).to be_a(Student)
    end
    
    it 'has readable attributes' do
      expect(student.name).to eq("Morgan")
      expect(student.age).to eq(21)
      expect(student.scores).to eq([])
    end
    
    it 'can log student scores' do
      student.log_score(89)
      student.log_score(78)
      expect(student.scores).to eq([89, 78])
    end
    
    it 'can determine the students grade' do
      student.log_score(89)
      student.log_score(78)
      expect(student.grade).to eq(83.5)
    end
  end
end
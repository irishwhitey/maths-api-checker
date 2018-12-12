class Problems
	def self.get_problems()
		return [
			Problem.new("3 + 4",7),
			Problem.new("5 + 2",7),
			Problem.new("5 - 1",4),
			Problem.new("7 * 2",14),
			Problem.new("-5 * 2",-10)
		]
	end
end

class Problem
	attr_reader:equation
	attr_reader:answer
	def initialize(equation, answer)      
    @equation = equation  
    @answer = answer  
  end
end 
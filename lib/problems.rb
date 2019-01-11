class Problems
	def self.get_problems()
		return [			
			Problem.new("3 + 4",7),
			Problem.new("-3 + 4",1),
			Problem.new("8 / 4",2),
			Problem.new("2 * 4",8),
			Problem.new("10 - 3",7),
			Problem.new("3 + 4 + 2",9),
			Problem.new("10 - 4 + 2",4),
			Problem.new("10 - 4 - 3",3),
			Problem.new("2 + 10 * 2",22),
			Problem.new("9 + 2 + 1",12),
			Problem.new("10 * 4 * 2",80),
			Problem.new("24 / 6 / 2",2),			
			Problem.new("10 ^ 2 ",100),
			Problem.new("10 + -4",6),
			Problem.new("3 * 1 * -4",-12),
			Problem.new("(1 + 2) * (2 + 3)",15),
			Problem.new("(2 * 2) / (1 + 1)",2),
			Problem.new("(3 - 2) * 1",1),
			Problem.new("(1 ^ 2) * (2 + 3)",5),
			Problem.new("(4 / 2) * (2 + 2)",8),
			Problem.new("(8) * (2 + 1)",24),
			Problem.new("(-1 + 2) * (2 + 3)",5),
			Problem.new("7 * (2 + 3)",35),
			Problem.new("(1 + 2) * 8)",24),
			Problem.new("(-3) * (-2)",6)			
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
class Calculator

  def initialize(current_value = 0, nums = [], operators = [])
    @current_value = current_value
    @nums = nums
    @operators = operators
  end


  def start
    puts @current_value
    input()
  end

  def input
    user_input = gets.chomp
    input_array = breakdown_user_input(user_input)

    #validate each input
    input_array.each do |value|
      validNumber(value)
    end
  end

  #splits user input into array
  def breakdown_user_input(user_input)
    input_array = user_input.split(" ")
  end

  def validNumber(value)
    begin
      result = Float(value)
      @nums.push(result)
    rescue ArgumentError, TypeError
      validOperator(num)
    end
  end

  def validOperator(value)
    validOperators = ['+', '-', '*', '/']
    
    begin
      validOperators.include?(value)
      @operators.push(value)
      calculate()
    rescue
      puts "Invalid operation. Please try again."
      input()
    end
  end

  def calculate
    #do stuff here
  end

end

calc1 = Calculator.new()
calc1.start()
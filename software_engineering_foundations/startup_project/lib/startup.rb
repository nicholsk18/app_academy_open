require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(different_startup)
    self.funding > different_startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "the title was invalid"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]

    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise "#{name} does not have enough funding!"
    end
  end

  def payday
    @employees.each do |employee|
      pay_employee(employee)
    end
  end

  def average_salary
    sum = @employees.sum { |employee| @salaries[employee.title] }
    sum / (@employees.length * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(another_startup)
    @funding += another_startup.funding
    # merge current startup in to another_startup hash
    # this way current startup salaries will override acquired startup salaries
    # set new salaries hash to current salaries
    # class example:
    #
    # another_startup.salaries.each do |title, amount|
    #   if !@salaries.has_key?(title)
    #     @salaries[title] = amount
    #   end
    # end

    @salaries = another_startup.salaries.merge(@salaries)

    # hire acquired startup employees
    @employees += another_startup.employees

    # close acquired startup
    another_startup.close
  end
end

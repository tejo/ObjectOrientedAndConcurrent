require "pry"


class Composition
  class Task
    attr_accessor :message

    def initialize(message)
      @message = message
    end

    def run()
      puts "running #{@message}"
    end
  end

  class Runner 
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def run(task)
      task.run()
    end

    def run_all(tasks)
      tasks.each do |task|
        run(task)
      end
    end
  end

  #// START_COUNTING OMIT
  class RunCounter 
    attr_accessor :runner # // HL
    attr_accessor :count

    def initialize(name)
      @runner = Runner.new(name)
      @count  = 0
    end

    def run(task)
      @count = @count + 1
      runner.run(task)
    end

    def run_all(tasks)
      @count = @count + tasks.size
      runner.run_all(tasks)
    end

    def name
      runner.name
    end
  end
  #// END_COUNTING OMIT

  def test()
    #// START_MAIN OMIT
    runner = RunCounter.new("my runner")

    tasks = [Task.new("one"), Task.new("two"), Task.new("three")] 
    runner.run_all(tasks);


    puts "#{runner.name} ran #{runner.count} tasks"

    #// END_MAIN OMIT
  end
end

Composition.new.test()


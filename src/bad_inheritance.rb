require 'pry'
class BadInheritance
  #// START_TASK OMIT
  class Task
    attr_accessor :message

    def initialize(message)
      @message = message
    end

    def run()
      puts "running #{@message}"
    end
  end
  #// END_TASK OMIT

  #// START_RUNNER OMIT
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
  #// END_RUNNER OMIT

  #// START_COUNTING OMIT
  class RunCounter < Runner 
    attr_accessor :count

    def initialize(message)
      super(message)
      @count = 0
    end

    def run(task)
      @count = @count + 1
      super(task)
    end

    def run_all(tasks)
      @count = @count + tasks.size
      super(tasks)
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

BadInheritance.new.test()

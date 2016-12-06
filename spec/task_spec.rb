
require("spec_helper")

describe(Task) do
  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
      expect(task1).to(eq(task2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#description') do
    it('returns its description') do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
      expect(task1.description()).to(eq('learn SQL'))
    end
  end

    describe("#save") do
      it("adds a task to the array of saved tasks") do
        test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
        test_task.save()
        expect(Task.all()).to(eq([test_task]))
      end
    end

    describe('#due_date') do
      it ('returns the task due date') do
        test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
        expect(test_task.due_date()).to(eq('2016-12-20 00:00:00'))
      end
    end

    describe('.all') do
      it ('returns all tasks when multiple tasks are saved') do
        task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-25 00:00:00'})
        task1.save()
        task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
        task2.save()
        task3 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-23 00:00:00'})
        task3.save()
        expect(Task.all()).to(eq([task1, task2, task3]))
      end
    end

    describe('.sort_by_due_date') do
      it ('sorts the list of tasks by their due date, soonest first') do
        task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-29 00:00:00'})
        task1.save()
        task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-27 00:00:00'})
        task2.save()
        task3 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-20 00:00:00'})
        task3.save()
        task4 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-25 00:00:00'})
        task4.save()
        task5 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-12-22 00:00:00'})
        task5.save()

        expect(Task.sort_by_due_date()).to(eq([task3, task5, task4, task2, task1]))
      end
    end


end

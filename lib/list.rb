class List

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |task2|
    self.name().==(task2.name()).&(self.id().==(task2.id()))
  end

  define_singleton_method(:all) do
    all_lists = DB.exec("SELECT * FROM lists;")
    arr_lists = []
    all_lists.each() do |list|
      current_list = List.new({:name => list.fetch("name"), :id => list.fetch('id').to_i()})
      arr_lists.push(current_list)
    end
    arr_lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
end

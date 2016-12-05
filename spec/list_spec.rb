require("spec_helper")

describe(List) do
  describe('.all') do
    it('it returns an empty array') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves itself into the database') do
      list = List.new(:name => "Getro", :id => nil)
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe('#name') do
    it ('returns its name') do
      list = List.new(:name => "Some list", :id => nil)
      expect(list.name()).to(eq('Some list'))
    end
  end

  describe('#id') do
    it ('returns its id') do
      list = List.new(:name => "Some list", :id => nil)
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it('compares two list objects and determines if they are the same') do
      list = List.new(:name => "list 1", :id => nil)
      list_2 = List.new(:name => "list 1", :id => nil)
      expect(list).to(eq(list_2))
    end
  end
end

class Tree
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if value < @value
      if @left
        @left.insert(value)
      else
        @left = Tree.new(value)
      end
    else
      if @right
        @right.insert(value)
      else
        @right = Tree.new(value)
      end
    end
  end

  def find(value, recursive = false)
    iterative_find(value)
  end

  def recursive_find(value)
    return self if @value == value

    if value < @value && @left
      return @left.recursive_find(value)
    end

    if value > @value && @right
      return @right.recursive_find(value)
    end
    nil
  end

  def iterative_find(value)
    current = self
    while current
      return current if current.value == value

      if value < current.value
        current = current.left
      else
        current = current.right
      end
    end
    nil
  end
end

def populate_directly
  root = Tree.new(5)
  root.left = Tree.new(3)
  root.left.left = Tree.new(1)
  root.left.right = Tree.new(4)
  root.right = Tree.new(8)
  root.right.right = Tree.new(9)
  root
end

def populate_by_insertion
  root = Tree.new(5)
  values_to_insert = [3, 1, 4, 4, 8, 9]
  values_to_insert.each do |value|
    root.insert(value)
  end
  root
end

tree = populate_by_insertion

p tree.find(5)
p tree.find(4)
p tree.find(9)
p tree.find(7)

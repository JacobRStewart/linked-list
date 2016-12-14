class Linked_List
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def head
    @head ? @head.value : "List is empty"
  end

  def tail
    @tail ? @tail.value : "List is empty"
  end

  def create_head(value)
    @head = Node.new(value)
    @tail = @head
  end


  def append(value)
    if @tail
      @tail.next = Node.new(value)
      @tail.next.previous = @tail
      @tail = @tail.next
    else
      create_head(value)
    end
  end

  def prepend(value)
    if @head
      @head.previous = Node.new(value)
      @head.previous.next = @head
      @head = @head.previous
    else
      create_head(value)
    end
  end

  def size(node=@head, count=1)
    if node.next
      node = node.next
      count += 1
      size(node, count)
    else
      return count
    end
  end

  def to_s(node=@head, list_graph="")
    if node.next
      list_graph += "( #{node.value.to_s} ) -> "
      node = node.next
      to_s(node, list_graph)
    else
      return list_graph += "nil"
    end
  end

  def at(target_index, node=@head, index=0)
    begin
      if index == target_index
        return node.value
      else
        node = node.next
        count += 1
        at(target_index, node, index)
      end
    rescue
      return "Index larger than list length"
    end
  end

  def pop
    begin
      @tail = @tail.previous
      @tail.next = nil
    rescue
      @tail = nil
    end
  end

  def contains?(value, node=@head)
    if node.value == value
      return true
    else
      return false if node.next == nil
      node = node.next
      contains?(value, node)
    end
  end

  def find(value, node=@head, index=0)
    begin
      if node.value == value
        return index
      else
        node = node.next
        index += 1
        find(value, node, index)
      end
    rescue
      return "Not found"
    end
  end


end


class Node
  attr_accessor :value, :previous, :next

  def initialize(value=nil)
    @value = value
    @previous = nil
    @next = nil
  end

end

list = Linked_List.new
list.append("apple")
list.append("banana")
list.append("cherry")
list.append("durian")
list.prepend("eggplant")

puts "Head: #{list.head}"
puts "Tail: #{list.tail}"
puts "Size: #{list.size}"
puts list.to_s
puts "Index at [2]: #{list.at(2)}"
list.pop
puts "List after pop:"
puts list.to_s
puts "List contains 'potato': #{list.contains?("potato")}"
puts "List contains 'banana': #{list.contains?("banana")}"
puts "'Banana' is at index: #{list.find("banana")}"

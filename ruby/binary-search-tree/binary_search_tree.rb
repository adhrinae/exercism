class Bst
  VERSION = 1

  attr_reader :root
  def initialize(data)
    @root = Node.new(data)
    @list = []
  end

  def data
    root.data
  end

  def left
    root.left
  end

  def right
    root.right
  end

  def insert(data)
    new_node = Node.new(data)

    insert_at_node(@root, new_node)
  end

  def each(&blk)
      sorted_nodes = []
      show_data = ->(data) { sorted_nodes << data }
      in_order_traverse(root, show_data)

      return sorted_nodes.to_enum unless block_given?
      sorted_nodes.each &blk
  end

  private

  def insert_at_node(parent_node, new_node)
    return parent_node = new_node if parent_node.nil?

    if parent_node.data >= new_node.data
      if parent_node.left.nil?
        parent_node.left = new_node
      else
        insert_at_node(parent_node.left, new_node)
      end
    elsif parent_node.data < new_node.data
      if parent_node.right.nil?
        parent_node.right = new_node
      else
        insert_at_node(parent_node.right, new_node)
      end
    end
  end

  def in_order_traverse(node, callback)
    return unless node
    in_order_traverse(node.left, callback) if node.left
    callback.call(node.data)
    in_order_traverse(node.right, callback) if node.right
  end
end

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

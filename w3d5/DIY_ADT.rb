  class Stack
    
    def initialize
        # create ivar to store stack here!
        @stack = []
    end
    
    def push(el)
        stack.push(el)
    end
    
    def pop
        stack.pop
    end
    
    def peek
        stack[-1]
    end
    private
    attr_reader :stack
  end


  class Queue
    
    def initialize
        @queue = []
    end

    def push(el)
        queue.push(el)
    end

    def shift
        queue.shift
    end

    def peek
        queue[0]
    end

    private
    attr_reader :queue
  end


  class Map
    def initialize
        @arr = []
    end

    def set(key, val)
        pair_index = arr.index { |pair| pair[0] == key}
        if pair_index
            arr[pair_index][1] = val
        else
            arr.push([key, val])
        end
        val
    end

    def get(key)
        arr.each { |pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        val = get(key)
        arr.reject! { |pair| pair[0] == key}
        val
    end

    def show
        deep_dup(arr)
    end

    def deep_dupe(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dupe(el) : el}
    end
    private
    attr_reader :arr

  end
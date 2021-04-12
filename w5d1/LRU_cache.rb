  class LRUCache
    attr_reader :size
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
        @cache << el
      elsif count >= size
        @cache.shift
        @cache << el
      else
        @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

  end
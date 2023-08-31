class LRUCache
  def initialize(max_size)
    @max_size = max_size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if !@cache.include?(el)
      if @cache.length < @max_size
        @cache.push(el)
      else
        @cache.shift
        @cache.push(el)
      end
    else
      @cache.delete(el)
      @cache.push(el)
    end

  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache

  end

  private
  # helper methods go here!

end

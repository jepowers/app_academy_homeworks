class LRUCache

  def initialize(cache_size)
    @cache = []
    @cache_max_size = cache_size
  end

  def  count
    @cache.length
  end

  def add(el)
    @cache.delete(el) if @cache.include?(el)
    @cache.pop if count >= @cache_max_size
    @cache.unshift(el)
  end

  def show
    #LRU item first
    @cache
  end

  private
  #helper methods
end

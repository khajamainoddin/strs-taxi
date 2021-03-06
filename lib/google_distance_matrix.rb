class GoogleDistanceMatrix
  include HTTParty
  base_uri 'maps.googleapis.com:443'

  def initialize(src_address, dst_address)
    api_key = 'AIzaSyBG-Evxz-EMExbgZsXcW32FyMIG1iO-bbE'
    src = src_address['lat'].to_s + ',' + src_address['lng'].to_s
    dst = dst_address['lat'].to_s + ',' + dst_address['lng'].to_s
    @options = { query: { units: 'metric', origins: src, destinations: dst, key: api_key } }
  end

  def get_distance_matrix
    self.class.get("/maps/api/distancematrix/json?", @options)
  end
end

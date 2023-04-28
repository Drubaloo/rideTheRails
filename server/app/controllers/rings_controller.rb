class RingsController < ApplicationController
  def index
    puts "hit"
    data = {name: "oneRing", owner: "sauron"}

    render json: data.to_json.encode("UTF-8"), content_type: 'application/json'
  end
end

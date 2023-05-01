class RingsController < ApplicationController
  def create
    # Your code here
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
    
    ring_params = params.require(:ring).permit(:name, :owner)
    # Do your processing here
    
    render json: { message: 'OK' }, status: :ok
  end
end


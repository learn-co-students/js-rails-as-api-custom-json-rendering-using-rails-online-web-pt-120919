class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, species]     #ONLY need to be used for array
    render json: birds, except: [:created_at, :updated_at]   #EXCEPT need to be used for array
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    if bird
    render json: bird.slice(:id, :name, :species) # SLICE works only for one 
    else 
      render json: { message: 'Bird not found' }
    end
  end

end
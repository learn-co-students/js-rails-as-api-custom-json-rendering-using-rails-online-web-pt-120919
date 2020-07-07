class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show

    if bird = Bird.find_by(id: params[:id])
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: "Sorry, #{params[:id]} not found" }
    end
  end
end

class BirdsController < ApplicationController
  def index
    birds = Bird.all

    # render every key and value pair
    # render json: birds
    
    # render only what you want to see
    # render json:birds, only: [:id, :name, :species]

    # alternatively, you can use except: to exclude particular keys you don't want to show
    # render json: birds, except: [:created_at, :updated_at]

    # this next line shows what is actually happening, the only and except keywords are actually parameters of the to_json method 
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  # new

  def show
    bird = Bird.find_by(id: params[:id])

    # sends id, name, species, created_at, and updated_at
    # render json: bird

    # to eliminate created_at and updated_at you must pick and choose what you want to send
    # render json: { id: bird.id, name: bird.name, species: bird.species }

    # or use Ruby's built-in slice method. Be careful, it won't work with an array of hashes like the one in our index action
    # render json: bird.slice(:id, :name, :species)

    # the only: option directly after listing an object we want to render to JSON
    # render json: bird, only: [:id, :name, :species]

    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end

  end
end
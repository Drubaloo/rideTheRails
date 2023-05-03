require 'net/http'
require 'json'

class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = current_user.pokemon.new(post_params)
    if @pokemon.save
      redirect_to @pokemon
    else
      render 'new'
    end
  end

  def edit
    @pokemon = current_user.pokemon.find(params[:id])
  end

  def update
    @pokemon = current_user.pokemon.find(params[:id])
    if @pokemon.update(post_params)
      redirect_to @pokemon
    else
      render 'edit'
    end
  end

  def destroy
    @pokemon = current_user.pokemon.find(params[:id])
    @pokemon.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:pokemon).permit(:title, :body)
  end
end

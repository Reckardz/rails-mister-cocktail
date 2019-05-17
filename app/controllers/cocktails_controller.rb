class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  private

  def strong_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end

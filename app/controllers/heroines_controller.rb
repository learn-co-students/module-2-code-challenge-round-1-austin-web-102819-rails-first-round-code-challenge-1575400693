class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @powers = Power.all
    @power = @powers.find(@heroine.power_id)
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  def search
    query = params[:q]
    @heroines = []
    heroines = Heroine.all.each do |x|
      heroine_power = Power.find(x.power_id).name
      if heroine_power.downcase.include?(query.downcase)
        @heroines << x
      end
    end
    @heroines
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end


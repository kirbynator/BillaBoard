class ChartsController < ApplicationController
  before_action :set_chart, only: [ :show, :edit, :update, :destroy]
  def index
    @charts = Chart.all
  end

  def show
    @artists= Artist.all
  end

  def new
    @chart = Chart.new
    render partial: "form"
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to admins_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
if @chart.update(chart_params)
  redirect_to admins_path
else
  render :edit
  end
end

def destroy
  @chart.destroy
  redirect_to admins_path
end


  private
  def set_chart
    @chart= Chart.find(params[:id])
  end

  def chart_params
    params.require(:chart).permit(:name, :genre)
  end

end

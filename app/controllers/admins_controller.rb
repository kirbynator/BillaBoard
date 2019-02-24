class AdminsController < ApplicationController
  def index
    @charts= Chart.all
    @artists= Artist.all
    @songs= Song.all
  end
  def show

  end
end

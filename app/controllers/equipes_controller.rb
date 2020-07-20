class EquipesController < ApplicationController
  def index
    @equipes = Equipe.all
  end
end

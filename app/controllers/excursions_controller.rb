class ExcursionsController < ApplicationController
  before_action :set_excursion, only: %i[show edit update destroy search]
  allow_unauthenticated_access only: %i[index show search]
  def index
    @excursions = Excursion.all
  end
  def show
    @excursion = Excursion.find(params[:id])
  end
  def new
    @excursion = Excursion.new
  end
  def create
    @excursion = Excursion.new(excursion_params)
    if @excursion.save
      redirect_to @excursion, notice: "Excursão criada com sucesso!."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @excursion = Excursion.find(params[:id])
  end
  def update
    if @excursion.update(excursion_params)
      redirect_to @excursion, notice: "Excursão atualizada com sucesso!."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @excursion.destroy
    redirect_to excursions_path, notice: "Excursão excluída com sucesso!."
  end
  def search
    @excursions = Excursion.where("name LIKE ?", "%#{params[:query]}%")
    if @excursions.empty?
      flash.now[:alert] = "Nenhuma excursão encontrada com o termo '#{params[:query]}'."
      render :index, status: :not_found
    else
      render :index
    end
  end

  private
    # Require exige que o parametro :excursion estejam agrupados sobre a chave :excursion
    # Permit permite que apenas os parametros :name
    def excursion_params
      params.require(:excursion).permit(:name)
    end
    def set_excursion
      @excursion = Excursion.find(params[:id])
    end
end

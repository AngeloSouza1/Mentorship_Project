class PartsController < ApplicationController
  before_action :set_part, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @parts = Part.all

    respond_to do |format|
      format.html
      format.json { render json: @parts }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.json { render json: @parts }
    end
  end

  def filtrar
    if params[:search_part].present?
      part_ids = Part.where("nome LIKE ?", "%#{params[:search_part]}%").pluck(:id)
      @assemblies_parts = AssembliesPart.where(part_id: part_ids)
    else
      @assemblies_parts = AssembliesPart.all
    end
    render :filtrar
  end


  def new
    @part = Part.new
  end

  def edit
  end

  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to part_url(@part), notice: "Parte criada com sucesso." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to part_url(@part), notice: "Parte atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @part.destroy!

    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Parte excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:part_number, :nome,:valor) 
  end
end

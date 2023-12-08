class AssembliesPartsController < ApplicationController
  before_action :set_assemblies_part, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @assemblies_parts = AssembliesPart.all
    respond_to do |format|
      format.html
      format.json { render json: @assemblies_parts }
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

  def show
    respond_to do |format|
      format.html
      format.json { render json: @assemblies_parts }
    end
  end

  def new
    @assemblies_part = AssembliesPart.new
  end

  def edit
  end

  def create
    @assemblies_part = AssembliesPart.new(assemblies_part_params)

    respond_to do |format|
      if @assemblies_part.save
        format.html { redirect_to assemblies_part_url(@assemblies_part), notice: "Parte da montagem criada com sucesso." }
        format.json { render :show, status: :created, location: @assemblies_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assemblies_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assemblies_part.update(assemblies_part_params)
        format.html { redirect_to assemblies_part_url(@assemblies_part), notice: "Parte da montagem atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @assemblies_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assemblies_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assemblies_part.destroy!

    respond_to do |format|
      format.html { redirect_to assemblies_parts_url, notice: "Parte da montagem excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_assemblies_part
    @assemblies_part = AssembliesPart.find(params[:id])
  end

  def assemblies_part_params
    params.require(:assemblies_part).permit(:assembly_id, :part_id, :book_id)
  end
end

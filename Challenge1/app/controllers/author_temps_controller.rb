class AuthorTempsController < ApplicationController
  before_action :set_author_temp, only: %i[ show edit update destroy ]

  # GET /author_temps or /author_temps.json
  def index
    @author_temps = AuthorTemp.all
  end

  # GET /author_temps/1 or /author_temps/1.json
  def show
  end

  # GET /author_temps/new
  def new
    @author_temp = AuthorTemp.new
  end

  # GET /author_temps/1/edit
  def edit
  end

  # POST /author_temps or /author_temps.json
  def create
    @author_temp = AuthorTemp.new(author_temp_params)

    respond_to do |format|
      if @author_temp.save
        format.html { redirect_to author_temp_url(@author_temp), notice: "Author temp was successfully created." }
        format.json { render :show, status: :created, location: @author_temp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_temps/1 or /author_temps/1.json
  def update
    respond_to do |format|
      if @author_temp.update(author_temp_params)
        format.html { redirect_to author_temp_url(@author_temp), notice: "Author temp was successfully updated." }
        format.json { render :show, status: :ok, location: @author_temp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_temps/1 or /author_temps/1.json
  def destroy
    @author_temp.destroy!

    respond_to do |format|
      format.html { redirect_to author_temps_url, notice: "Author temp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_temp
      @author_temp = AuthorTemp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_temp_params
      params.require(:author_temp).permit(:sup_id, :name)
    end
end

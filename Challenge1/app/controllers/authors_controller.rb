class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @authors = Author.all
    respond_to do |format|
      format.html
      format.json { render json: @authors }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @authors }
    end
  end
 
  def filtrar
    if params[:search_author].present?
      @books = Book.joins(:author).where("authors.name LIKE ?", "%#{params[:search_author]}%")
    else
      @books = Book.all
    end
    Rails.logger.info "DEBUG: Books - #{@books.inspect}" # Adicione esta linha
    render :filtrar
  end
  

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if author.save
        format.html { redirect_to author_url(author), notice: "Autor criado com sucesso." }
        format.json { render :show, status: :created, location: author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_url(@author), notice: "Autor atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    author.destroy!

    respond_to do |format|
      format.html { redirect_to authors_url, notice: "Autor excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name,:cpf)
  end
end

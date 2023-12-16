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

  end
  
  def relatorio
    if params[:search_author].present?
      @authors = Author.where("name LIKE ?", "%#{params[:search_author]}%")
    else
      @authors = Author.all
    end
    render :relatorio
  end


  def gerar
    author_id = params[:author_id]
    @authors = Author.find_by(id: author_id)
  end  


def gerar_author_pdf
  author_id = params[:author_id]
  @authors = Author.find_by(id: author_id)

  respond_to do |format|
    format.pdf do
      pdf = Prawn::Document.new

    pdf.font_families.update(
    'Roboto' => {
      normal: Rails.root.join('app', 'assets', 'fonts', 'Roboto-Regular.ttf'),
      italic: Rails.root.join('app', 'assets', 'fonts', 'Roboto-Italic.ttf'),
      bold: Rails.root.join('app', 'assets', 'fonts', 'Roboto-Bold.ttf'),
      bold_italic: Rails.root.join('app', 'assets', 'fonts', 'Roboto-BoldItalic.ttf')
    }
    )
      pdf.font 'Roboto'
      pdf.text "Relatório de Autor", size: 18, align: :center,style: :bold
      pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
      pdf.move_down 3
      if @authors.present?
        pdf.move_down 10
        pdf.text "Dados", size: 12, style: :bold
        pdf.move_down 4
        pdf.text "ID Autor: #{@authors.id}", size: 10
        pdf.move_down 3
        pdf.text "Autor:     #{@authors.name}", size: 10
        pdf.move_down 4
        pdf.text "CPF:       #{@authors.cpf}", size: 10
        pdf.move_down 10
        pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
        if @authors.books.present?
          pdf.move_down 8
          pdf.text "Livros", size: 12, style: :bold
          pdf.move_down 3
          books_data = [['ID', 'Título', 'ISBN', 'Publicação']]
          @authors.books.each do |book|
            books_data << [book.id, book.title, book.isbn, book.publishing.to_s]
          end
          pdf.table(books_data, header: true, width: pdf.bounds.width) do
            row(0).font_style = :bold
            self.row_colors = ['DDDDDD', 'FFFFFF']
            cells.size = 10  
          end
          pdf.move_down 8
          pdf.text "Total de Livros: #{@authors.books.count}", size: 12, style: :bold,align: :center 
          pdf.move_down 4
          pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
        else
          pdf.text "Nenhum livro encontrado para este autor.", size: 10
        end
      else
        pdf.text "Autor não encontrado.", size: 10
      end

      send_data pdf.render, filename: 'relatorio_autor.pdf', type: 'application/pdf', disposition: 'inline'
    end
  end
end


  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_path(@author), notice: "Autor criado com sucesso." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
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
    @author.destroy!

    respond_to do |format|
      format.html { redirect_to authors_url, notice: "Autor excluído com sucesso." }
    end
  end


  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name,:cpf, :sup_id)
  end
end

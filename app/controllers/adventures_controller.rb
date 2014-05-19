class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventures =Adventure.where(library_id: nil)
    #binding.pry
    @library = Library.new
    respond_to do |format|
      format.html
      format.json { render :json => {:adventures => @adventures.as_json(except: [:id, :library_id], include: {:pages => {except: [:id, :adventure_id, :created_at, :updated_at]} })} }
    end
  end

  def new
    @adventure = Adventure.new
    @page = @adventure.pages.build
    # @library = @library.adventure.create
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:id])
    adventure.update_attributes adventure_params
    redirect_to root_path
  end

  def show
    # id = params[:id]
    @adventure = Adventure.find(params[:id])
    @page = Page.new
    @start = Adventure.find(@adventure).pages.find_by(name: "start")
    redirect_to adventure_page_path(@adventure, @start)
  end

  def create
    @adventure = Adventure.new adventure_params
    @adventure.guid = SecureRandom.urlsafe_base64(10)
    if @adventure.save
      redirect_to new_adventure_page_path(@adventure)
    else
      flash[:errors] = @adventure.errors.full_messages
      render :edit
      redirect_to :back
    end
  end

  private
  def adventure_params
    params.require(:adventure).permit(:title, :author, :pages_attributes=>[:name, :text], :libraries_attributes=>[:url])
  end

end

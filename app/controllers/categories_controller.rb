class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update]
  
  def show
  end
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)    
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)    
    if @category.save
        # render plain: @article.inspect
        # redirect_to article_path(@article)
        flash[:notice] = "Category created."
        redirect_to @category
    else
        render 'new'
    end
  end

  def edit
  end

  def update    
    if @category.update(category_params)
      flash[:notice] = "Category updated."
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def set_category    
    @category = Category.find(params['id'])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end

end

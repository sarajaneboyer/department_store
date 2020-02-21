class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = @department.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    #@item = @department.items.new
    @item = Item.new(department_id: params[:department_id])
    render partial: "form"
  end

  def edit
    @item = Item.find(params[:id])
    render partial: "form"
  end

  def create
    @item = @department.items.new(items_params)

    if @item.save
      redirect_to [@department, @item]
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if (@item.update(item_params))
      redirect_to department_path(@department, @item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to department_path
  end

  private

  def set_department
    @department = Department.find(params[:department_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end

end

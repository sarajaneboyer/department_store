class DepartmentsController < ApplicationController
  #before_action :set_item
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new

  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    set_department

    if @department.update(department_params)
      redirect_to departments_path
    else
      render :edit
    end
  end

  def destroy
    set_department.destroy
    redirect_to departments_path
  end


  private
    def set_department
       @department = Department.find(params[:id])
    end

    def department_params
       params.require(:department).permit(:name)
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

end

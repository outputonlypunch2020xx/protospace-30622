class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_prototype, only: [:index, :show]
  before_action :double_prototype, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  

  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    if Prototype.create(prototype_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:titel, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototypes = Prototype.all
  end

  def double_prototype
    @prototype = Prototype.find(params[:id])
  end



  def correct_user
     unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end
   end

end
class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
   @post = Post.all
	end
  def new
    binding.pry
   @post = Post.new
  end
	def create
    binding.pry
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
      flash[:notice] = "Customer Created!"
    else
      render :new
      flash[:error] = "Something Went Wrong"
    end
  end
   def edit
    @post = Post.find(params[:id])
   end
   def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to root_path
      flash[:notice] = "Updated Successfully"
    else
      render :edit
      flash[:error] = "Something Went Wrong"
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  def show
     @post = Post.find(params[:id])
  end
  private 
  def posts_params
    binding.pry
  	params.require(:post).permit!
  end
end

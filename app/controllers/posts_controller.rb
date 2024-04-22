class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!, except: %i[ index show ]

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc).all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create

    respond_to do |format|
      if Current.user.posts.create(post_params)
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update

      if Current.user == @post.user &&  @post.update(post_update_params)
        redirect_to posts_path, notice: "Post atualizado com sucesso"
      else
        redirect_to posts_path, notice: "Nao é possivel editar esse post"
        # render json: { error: "Nao foi possivel editar o post" }, status: :unprocessable_entity
      end

  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if Current.user == @post.user
      @post.destroy
      redirect_to posts_path, notice: "Post deletado com sucesso"
    else
      redirect_to posts_path, notice: "Nao é possivel deletar esse post"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

    def post_update_params
      params.require(:post).permit(:id, :title, :content, :user_id)
    end


end

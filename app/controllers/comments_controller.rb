class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_current_page


  rescue_from ActiveRecord::RecordNotFound, with: :show_record_not_found

  def set_current_page
    @current_page = params[:page] || 1
  end

  # GET /comments
  def index
    @comments = Comment.paginate(page: params[:page],
                                 per_page: params[:per_page])
                    .order('updated_at DESC')
    @read_post = 0
  end



  # GET /comments/1
  def show

  end


  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    #create comment set user_id to the current_user id and set replies count to 0
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.replies_count = 0
    @comment.updated_at = Time.now

    respond_to do |format|
      if @comment.save
        format.html {redirect_to (comment_url(@comment, page: @current_page)), notice: 'Thread was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment.updated_at = Time.now
    respond_to do |format|
      if @comment.update(comment_params)
        format.html {redirect_to (comment_url(@comment, page: @current_page)), notice: 'Thread was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to comments_path(page: @current_page), notice: 'Thread was successfully destroyed.'}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :anonymous, :title, :user_id)
  end
end

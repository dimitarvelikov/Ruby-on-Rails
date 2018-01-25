class API::CommentsController < API::ApplicationController
  include CommentsCommon
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :show_record_not_found

  # GET /comments.json
  def index
    if params.key?(:all)
      @comments = Comment.all.order('updated_at DESC')
    else
      @comments = Comment.paginate(page: params[:page],
                                   per_page: params[:per_page])
                      .order('updated_at DESC')
    end
    @read_post = 0
  end

  # GET /comments/1.json
  def show

  end


  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments.json
  def create
    respond_to do |format|
      format.json do
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.replies_count = 0
        @comment.updated_at = Time.now
        if @comment.save
          format.json {render :show, status: :created, location: @comment}
        else
          format.json {render json: @comment.errors, status: :unprocessable_entity}
        end
      end
    end
  end



  # PATCH/PUT /comments/1.json
  def update
    @comment.updated_at = Time.now
    respond_to do |format|
      if @comment.update(comment_params)

        format.json {render :show, status: :ok, location: @comment}
      else
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /comments/1.json
  def destroy
    Reply.all.each do |reply|
      if reply.post_id == params[:id]
        User.all.each do |user|
          user.read_post_ids.each do |read_posts|
            if reply.id == read_posts.read_id
              user.read_post_ids.delete(read_posts)
              user.save
            end
          end
        end
      end
    end


    @comment.destroy
    respond_to do |format|
      format.json {head :no_content}
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

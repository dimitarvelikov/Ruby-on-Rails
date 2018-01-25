class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_comment, only: [:create, :new]
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show

  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create

    if !reply_params[:parent_id].present?
      #parent reply
      @reply = @comment.replies.create(reply_params)
    else
      #nested reply
      @reply = Reply.find(reply_params[:parent_id]).replies.create(reply_params)
    end
    #notification code here
    #notify the user who has created the post
    if @comment.user_id != current_user.user_id

      thread_poster = User.find(@comment.user_id)
      same_post_notification = false
      exist = false
      thread_poster.post_notifications.each do |post_notification|
        #if there is unseen notification for this thread just update the time
        if post_notification.post_id == @comment.id && post_notification.seen == false
          same_post_notification = true
          exist = true
          post_notification.updated_at = Time.now
          post_notification.save

          #else if there is a seen notifiaction for this thread update the time and set seen as false
        elsif post_notification.post_id == @comment.id && post_notification.seen == true
          exist = true
          post_notification.seen = false
          post_notification.updated_at = Time.now
          post_notification.save
        end
      end
      #if there isn't existing notification for this thread post create a new notification
      if !same_post_notification && !exist
        thread_poster.post_notifications.create(:seen => false, :post_id => @comment.id, :user_id => current_user.id)
      end
    end


    respond_to do |format|
      if @reply.save
        #increment replies counter of the Thread by 1
        @comment.replies_count += 1
        @comment.updated_at = Time.now
        @comment.save

        format.html {redirect_to @comment, notice: 'Reply was successfully created.'}
        format.json {render :show, status: :created, location: @reply}
      else
        format.html {render :new}
        format.json {render json: @reply.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update

    @reply.update(reply_params)
    respond_to do |format|
      if @reply.update(reply_params)
        #    @comment.replies.update(reply_params)
        format.html {redirect_to @comment, notice: 'Reply was successfully updated.'}
        format.json {render :show, status: :ok, location: @reply}
      else
        format.html {render :edit}
        format.json {render json: @reply.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy

    User.all.each(:readonly => false) do |user|
      user.read_post_ids.all.each(:readonly => false) do |read_post|
        if read_post.read_id == @reply.id
          read_post.destroy
          user.save
          user.read_post_ids.save
        end
      end
    end

    @reply.destroy
    respond_to do |format|
      format.html {redirect_to @comment, notice: 'Reply was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reply_params
    params.require(:reply).permit(:user_id, :anonymous, :text, :post_id, :title,
                                  :parent_id, :child_number, :comment_id)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end

class ReadPostIdsController < ApplicationController
  before_action :set_read_post_id, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :destroy]

  # GET /read_post_ids
  # GET /read_post_ids.json
  def index
    @read_post_ids = ReadPostId.all
  end

  # GET /read_post_ids/1
  # GET /read_post_ids/1.json
  def show
  end

  # GET /read_post_ids/new
  def new
    @read_post_id = ReadPostId.new
  end

  # GET /read_post_ids/1/edit
  def edit
  end

  # POST /read_post_ids
  # POST /read_post_ids.json
  def create

    @reply = @user.read_post_id.create(read_post_id_params)
    respond_to do |format|
      if @read_post_id.save
        format.html {redirect_to @read_post_id, notice: 'Read post was successfully created.'}
        format.json {render :show, status: :created, location: @read_post_id}
      else
        format.html {render :new}
        format.json {render json: @read_post_id.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /read_post_ids/1
  # PATCH/PUT /read_post_ids/1.json
  def update
    respond_to do |format|
      if @read_post_id.update(read_post_id_params)
        format.html {redirect_to @read_post_id, notice: 'Read post was successfully updated.'}
        format.json {render :show, status: :ok, location: @read_post_id}
      else
        format.html {render :edit}
        format.json {render json: @read_post_id.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /read_post_ids/1
  # DELETE /read_post_ids/1.json
  def destroy
    @read_post_id.destroy
    respond_to do |format|
      format.html {redirect_to read_post_ids_url, notice: 'Read post was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_read_post_id
    @read_post_id = ReadPostId.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def read_post_id_params
    params.require(:read_post_id).permit(:id)
  end


  def set_user
    @user = User.find(current_user.id)
  end
end

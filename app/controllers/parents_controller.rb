class ParentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parent, only: %i[ show edit update destroy ]

  # GET /parents or /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1 or /parents/1.json
  def show
  end

  # GET /parents/new
  def new
    begin
      authorize Parent
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете этого сделать!'
      return
    end

    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
    begin
      authorize Parent
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете изменять данные этого пользователя.'
      return
    end
  end

  # POST /parents or /parents.json
  def create
    begin
      authorize Parent
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете изменять данные этого пользователя.'
      return
    end

    @parent = Parent.new(parent_params)
    @parent.user = current_user

    respond_to do |format|
      if @parent.save
        format.html { redirect_to parent_url(@parent), notice: "Parent was successfully created." }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1 or /parents/1.json
  def update
    begin
      authorize @parent
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете изменять данные этого пользователя.'
      return
    end

    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to parent_url(@parent), notice: "Parent was successfully updated." }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1 or /parents/1.json
  def destroy
    begin
      authorize Parent
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете изменять данные этого пользователя.'
      return
    end

    @parent.destroy!

    respond_to do |format|
      format.html { redirect_to parents_url, notice: "Parent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parent_params
      params.require(:parent).permit(:city, :teacher_gender, :teacher_age, :teacher_rate, :user_id)
    end
end

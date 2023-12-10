class TeachersController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    @user = current_user
  end

  # GET /teachers/new
  def new
    begin
      authorize Teacher
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете этого сделать!'
      return
    end

    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
    begin
      authorize @teacher
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете изменять данные этого пользователя.'
      return
    end
  end

  # POST /teachers or /teachers.json
  def create
    begin
      authorize Teacher
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете этого сделать!'
      return
    end
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    begin
      authorize @teacher
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете изменять данные этого пользователя.'
      return
    end
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    begin
      authorize @teacher
    rescue Pundit::NotAuthorizedError
      redirect_to profile_path, notice: 'Вы не можете этого сделать!'
      return
    end
    @teacher.destroy!

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:gender, :birthday, :city, :rate, :user_id)
    end
end

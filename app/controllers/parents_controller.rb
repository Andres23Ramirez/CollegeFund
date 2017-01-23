class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy], except: [:add_student]
  before_action :authenticate_user!

  def add_student
    @parent = Parent.find(params[:id])
    @student = Student.where("username = ?", params[:username])
    unless @student==nil 
      @student = @student.first
    end

    unless @student==nil
      @parent.students.push(@student)
    end
    
      respond_to do |format|    
        if @parent.save
          format.html { redirect_to parent_path(@parent), notice: 'Parent actulite sucesfully' }
          format.json { render :show, status: :created, location: @parent }
        else
          format.html { render :new }
          format.json { render json: @parent, status: :unprocessable_entity }
        end
      end
  end
  

  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @student
    @students = Student.all
  end

  # GET /parents/new
  def new
    @parent = Parent.new

  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)
    @user = current_user
    @user.add_role :parent
    @parent.user= current_user

    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:address, :user_id)
    end

    


end

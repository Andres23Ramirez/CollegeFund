class KeyDonorsController < ApplicationController
  before_action :set_key_donor, only: [:show, :edit, :update, :destroy], except: [:search]

  def search
   
   @students = Student.find_by username: params[:username]
   

  end
  # GET /key_donors
  # GET /key_donors.json
  def index
    @key_donors = KeyDonor.all
  end

  # GET /key_donors/1
  # GET /key_donors/1.json
  def show
  end

  # GET /key_donors/new
  def new
    #@key_donor = KeyDonor.new
    #@donor = Donor.find(params[:donor_id])
    #@student = Student.find(params[:student_id])
    
  end

  # GET /key_donors/1/edit
  def edit
  end 

  # POST /key_donors
  # POST /key_donors.json
  def create
    @key_donor = KeyDonor.new(key_donor_params)

    respond_to do |format|
      if @key_donor.save
        format.html { redirect_to @key_donor, notice: 'Key donor was successfully created.' }
        format.json { render :show, status: :created, location: @key_donor }
      else
        format.html { render :new }
        format.json { render json: @key_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_donors/1
  # PATCH/PUT /key_donors/1.json
  def update
    respond_to do |format|
      if @key_donor.update(key_donor_params)
        format.html { redirect_to @key_donor, notice: 'Key donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_donor }
      else
        format.html { render :edit }
        format.json { render json: @key_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_donors/1
  # DELETE /key_donors/1.json
  def destroy
    @key_donor.destroy
    respond_to do |format|
      format.html { redirect_to key_donors_url, notice: 'Key donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_donor
      @key_donor = KeyDonor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_donor_params
      params.require(:key_donor).permit(:relationship, :Students_id, :Donor_id, :donation_id)
    end
end

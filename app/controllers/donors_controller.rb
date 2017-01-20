class DonorsController < ApplicationController
  before_action :set_donor, only: [:show, :edit, :update, :destroy]

  def donation
    @donor = Donor.find(params[:id])
    @student = Student.find(params[:id_student])
    @key_donor = KeyDonor.new
    @key_donor.students_id = @student.id
    @key_donor.donor_id = @donor.id
    @donation = Donation.new
    @donation.amount = params[:amount]
    @donation.note =  params[:note]

    if @donation.save
      @key_donor.donation = @donation
      respond_to do |format|    
        if @key_donor.save
         format.html { redirect_to key_donor_path(@key_donor), notice: 'Key Donor was successfully created.' }
          format.json { render :show, status: :created, location: @key_donor }
        else
          format.html { render :new }
          format.json { render json: @key_donor.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # GET /donors
  # GET /donors.json
  def index
    @donors = Donor.all
  end

  # GET /donors/1
  # GET /donors/1.json
  def show

    if params[:username].present?
       @students = Student.where("username = ?", params[:username])
       @student = @students.first
       render "show"
    end

  end

  # GET /donors/new
  def new
    @donor = Donor.new
    @key_donor = KeyDonor.new
  end

  # GET /donors/1/edit
  def edit
  end

  # POST /donors
  # POST /donors.json
  def create
    @donor = Donor.new(donor_params)
    @user = current_user
    @user.add_role :donor
    @donor.user= current_user

    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
        format.json { render :show, status: :created, location: @donor }
      else
        format.html { render :new }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donors/1
  # PATCH/PUT /donors/1.json
  def update
    respond_to do |format|
      if @donor.update(donor_params)
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @donor }
      else
        format.html { render :edit }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_params
      params.fetch(:donor, {})
    end
end

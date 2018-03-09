class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_forms, only: [:show]
  before_action :set_state_list, only: [:show, :new, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    case @user.action
    when "CofA"
      @action = "Change Of Address"
    when "AR"
      @action = "Annual Report"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_url(@user), notice: 'User was successfully created.' }
        format.json { render :edit, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:state, :city, :action, :entity, :employees, :revenue, :registered_agent, :email)
    end

    def set_user_forms
      @user.actions.destroy_all
      general_forms = Form.where(state: [@user.state, "ALL"], entity: [@user.entity, "ALL"], action: [@user.action, "ALL"])
      forms = []
      (forms << general_forms.to_a).flatten!

      employee_forms = Form.where(state: [@user.state, "ALL"], entity: [@user.entity, "ALL"], action: [@user.action, "ALL"], condition: "employees")
      if @user.employees && employee_forms
        (forms << employee_forms.to_a).flatten!
      end

      revenue_forms = Form.where(state: [@user.state, "ALL"], entity: [@user.entity, "ALL"], action: [@user.action, "ALL"], condition: "revenue")
      if @user.revenue && revenue_forms
        (forms << revenue_forms.to_a).flatten!
      end
      forms.uniq!
      @forms = forms
      forms.each do |form|
        @user.actions.create(form: form)
      end
    end

end

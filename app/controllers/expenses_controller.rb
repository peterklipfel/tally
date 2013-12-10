class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all_for_user(current_user)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if ((can_access_invoice expense_params, @expense) && @expense.save)
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      # I'm not getting the expense directly from here because ActiveRecord
      # makes joined models read only
      user_expenses = Expense.all_for_user(current_user).pluck(:id)
      @expense = Expense.find(params[:id])
      unless user_expenses.include? @expense.id
        flash[:notice] = "Could not find requested expense"
        redirect_to expenses_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params[:expense].permit(:task, :rate, :time, :invoice_id)
    end

    # TODO: Refactor into respective models
    def can_access_invoice expense_params, expense
      (Invoice.all_for_user(current_user).pluck(:id).include?(expense_params["invoice_id"].to_i) ||
      Invoice.all_for_user(current_user).pluck(:id).include?(expense.invoice.try(:id)))
    end
end

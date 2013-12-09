class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all_for_user(current_user)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      # TODO: Make this less ugly
      if ((can_access_client invoice_params, @invoice) && @invoice.save)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      # I'm not getting the invoice directly from here because ActiveRecord
      # makes joined models read only
      user_invoices = Invoice.all_for_user(current_user).pluck(:id)
      @invoice = Invoice.find(params[:id])
      unless user_invoices.include? @invoice.id
        flash[:notice] = "Could not find requested invoice"
        redirect_to invoices_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params[:invoice].permit(:title, :client_id)
    end

    # TODO: Refactor into respective models
    def can_access_client invoice_params, invoice
      (current_user.clients.pluck(:id).include?(invoice_params["client_id"].to_i) ||
      current_user.clients.pluck(:id).include?(invoice.client.try(:id)))
    end
end

require 'spec_helper'
include Devise::TestHelpers

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InvoicesController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user2 = FactoryGirl.create(:user)
  end
  let(:your_invoice) { FactoryGirl.create(:invoice, user: @user2) }
  let(:my_invoice) { FactoryGirl.create(:invoice, user: @user) }

  # This should return the minimal set of attributes required to create a valid
  # Invoice. As you add validations to Invoice, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InvoicesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all of my invoices as @invoices" do
      get :index, {}
      assigns(:invoices).should eq([my_invoice])
    end
    it "does not show invoices that are not mine" do
      get :index, {}
      assigns(:invoices).should_not include(your_invoice)
    end
  end

  describe "GET show" do
    it "assigns the requested invoice as @invoice" do
      get :show, {:id => my_invoice.to_param}
      assigns(:invoice).should eq(my_invoice)
    end
    it "redirects to index if I'm not allowed to see the invoice" do
      get :show, {id: your_invoice.to_param}
      response.should redirect_to(invoices_path)
    end
  end

  describe "GET new" do
    it "assigns a new invoice as @invoice" do
      get :new, {}
      assigns(:invoice).should be_a_new(Invoice)
    end
  end

  describe "GET edit" do
    it "assigns the requested invoice as @invoice" do
      get :edit, {:id => my_invoice.to_param}
      assigns(:invoice).should eq(my_invoice)
    end
    it "redirects to index if I'm not allowed to see the invoice" do
      get :edit, {:id => your_invoice.to_param}
      response.should redirect_to(invoices_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Invoice" do
        client = my_invoice.client
        expect {
          post :create, {:invoice => {client_id: client.to_param, title: "Attending Concerts"}}
        }.to change(Invoice, :count).by(1)
      end

      it "assigns a newly created invoice as @invoice" do
        post :create, {:invoice => {client_id: my_invoice.client.to_param, title: "Attending Concerts"}}
        assigns(:invoice).should be_a(Invoice)
        assigns(:invoice).should be_persisted
      end

      it "redirects to the created invoice" do
        post :create, {:invoice => {client_id: my_invoice.client.to_param, title: "Attending Concerts"}}
        response.should redirect_to(Invoice.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved invoice as @invoice" do
        # Trigger the behavior that occurs when invalid params are submitted
        Invoice.any_instance.stub(:save).and_return(false)
        post :create, {:invoice => {  }}
        assigns(:invoice).should be_a_new(Invoice)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Invoice.any_instance.stub(:save).and_return(false)
        post :create, {:invoice => {  }}
        response.should render_template("new")
      end
    end

    it "does not save an invoice for a client that is not associated with me" do
      post :create, {:invoice => {client_id: your_invoice.client, title: "Attending Concerts"}}
      assigns(:invoice).should_not be_persisted
    end
  end

  describe "PUT update" do
    describe "when it is associated with me" do
      describe "with valid params" do
        it "updates the requested invoice" do
          Invoice.any_instance.should_receive(:update).with({ "title" => "Alphabet Ordering" })
          put :update, {:id => my_invoice.to_param, :invoice => { "title" => "Alphabet Ordering" }}
        end

        it "assigns the requested invoice as @invoice" do
          put :update, {:id => my_invoice.to_param, :invoice => valid_attributes}
          assigns(:invoice).should eq(my_invoice)
        end

        it "redirects to the invoice" do
          put :update, {:id => my_invoice.to_param, :invoice => valid_attributes}
          response.should redirect_to(my_invoice)
        end
      end

      describe "with invalid params" do
        it "assigns the invoice as @invoice" do
          Invoice.any_instance.stub(:save).and_return(false)
          put :update, {:id => my_invoice.to_param, :invoice => {  }}
          assigns(:invoice).should eq(my_invoice)
        end

        it "re-renders the 'edit' template" do
          Invoice.any_instance.stub(:save).and_return(false)
          put :update, {:id => my_invoice.to_param, :invoice => {  }}
          response.should render_template("edit")
        end
      end
    end
    describe "that is not associated with me" do
      it "reredirects to the index page" do
        put :update, {:id => your_invoice.to_param, :invoice => {  }}
        response.should redirect_to(invoices_path)
      end
    end
  end

  describe "DELETE destroy" do
    describe "when it is associated with me" do
      it "destroys the requested invoice" do
        invoice = Invoice.create! client_id: my_invoice.client.id
        expect {
          delete :destroy, {:id => invoice.to_param}
        }.to change(Invoice, :count).by(-1)
      end
      it "redirects to the invoices list" do
        invoice = Invoice.create! client_id: my_invoice.client.id
        delete :destroy, {:id => invoice.to_param}
        response.should redirect_to(invoices_url)
      end
    end

    describe "when it is not associated with me" do
      it "does not destroy the requested invoice" do
        invoice = Invoice.create! client_id: your_invoice.client.id
        expect {
          delete :destroy, {:id => invoice.to_param}
        }.to change(Invoice, :count).by(0)
      end
      it "redirects to the invoices index path" do
        delete :destroy, {:id => your_invoice.to_param}
        response.should redirect_to(invoices_url)
      end
    end
  end

end

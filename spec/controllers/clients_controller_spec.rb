require 'spec_helper'

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

describe ClientsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user2 = FactoryGirl.create(:user)
  end
  let(:your_client) { FactoryGirl.create(:client, user: @user2) }
  let(:my_client) { FactoryGirl.create(:client, user: @user) }

  # This should return the minimal set of attributes required to create a valid
  # Client. As you add validations to Client, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClientsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all clients as @clients" do
      get :index, {}
      assigns(:clients).should eq([my_client])
    end
  end

  describe "GET show" do
    it "assigns the requested client as @client" do
      client = Client.create! valid_attributes
      get :show, {:id => client.to_param}
      assigns(:client).should eq(client)
    end
  end

  describe "GET new" do
    it "assigns a new client as @client" do
      get :new, {}
      assigns(:client).should be_a_new(Client)
    end
  end

  describe "GET edit" do
    it "assigns the requested client as @client" do
      client = Client.create! valid_attributes
      get :edit, {:id => client.to_param}
      assigns(:client).should eq(client)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Client" do
        expect {
          post :create, {:client => valid_attributes}
        }.to change(Client, :count).by(1)
      end

      it "assigns a newly created client as @client" do
        post :create, {:client => valid_attributes}
        assigns(:client).should be_a(Client)
        assigns(:client).should be_persisted
      end

      it "redirects to the created client" do
        post :create, {:client => valid_attributes}
        response.should redirect_to(Client.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved client as @client" do
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        post :create, {:client => {  }}
        assigns(:client).should be_a_new(Client)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        post :create, {:client => {  }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested client" do
        client = Client.create! valid_attributes
        # Assuming there are no other clients in the database, this
        # specifies that the Client created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Client.any_instance.should_receive(:update).with({ "name" => "Spring" })
        put :update, {:id => client.to_param, :client => { "name" => "Spring" }}
      end

      it "assigns the requested client as @client" do
        client = Client.create! valid_attributes
        put :update, {:id => client.to_param, :client => valid_attributes}
        assigns(:client).should eq(client)
      end

      it "redirects to the client" do
        client = Client.create! valid_attributes
        put :update, {:id => client.to_param, :client => valid_attributes}
        response.should redirect_to(client)
      end
    end

    describe "with invalid params" do
      it "assigns the client as @client" do
        client = Client.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        put :update, {:id => client.to_param, :client => {  }}
        assigns(:client).should eq(client)
      end

      it "re-renders the 'edit' template" do
        client = Client.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        put :update, {:id => client.to_param, :client => {  }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested client" do
      client = Client.create! valid_attributes
      expect {
        delete :destroy, {:id => client.to_param}
      }.to change(Client, :count).by(-1)
    end

    it "redirects to the clients list" do
      client = Client.create! valid_attributes
      delete :destroy, {:id => client.to_param}
      response.should redirect_to(clients_url)
    end
  end

end

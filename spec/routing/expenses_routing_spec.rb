require "spec_helper"

describe ExpensesController do
  describe "routing" do

    it "routes to #new" do
      get("/invoices/1/expenses/new").should route_to("expenses#new", invoice_id: "1")
    end

    it "routes to #show" do
      get("/invoices/1/expenses/1").should route_to("expenses#show", id: "1", invoice_id: "1")
    end

    it "routes to #edit" do
      get("/invoices/1/expenses/1/edit").should route_to("expenses#edit", id: "1", invoice_id: "1")
    end

    it "routes to #create" do
      post("/invoices/1/expenses").should route_to("expenses#create", invoice_id: "1")
    end

    it "routes to #update" do
      put("/invoices/1/expenses/1").should route_to("expenses#update", id: "1", invoice_id: "1")
    end

    it "routes to #destroy" do
      delete("/invoices/1/expenses/1").should route_to("expenses#destroy", id: "1", invoice_id: "1")
    end

  end
end

# require 'spec_helper'

# describe ItemsController do

#   # This should return the minimal set of attributes required to create a valid
#   # Item. As you add validations to Item, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) { {
#       "available" => "false",
#       "name" => "Man Beer",
#       "description" => "A manly beer for manly men.",
#       "price" => 500,
#       "cost" => 200
#     } }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # ItemsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all items as @items" do
#       item = FactoryGirl.create(:item)
#       get :index, {}, valid_session
#       assigns(:items).should eq([item])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested item as @item" do
#       item = FactoryGirl.create(:item)
#       get :show, {:id => item.to_param}, valid_session
#       assigns(:item).should eq(item)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new item as @item" do
#       get :new, {}, valid_session
#       assigns(:item).should be_a_new(Item)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested item as @item" do
#       item = FactoryGirl.create(:item)
#       get :edit, {:id => item.to_param}, valid_session
#       assigns(:item).should eq(item)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Item" do
#         expect {
#           post :create, {:item => valid_attributes}, valid_session
#         }.to change(Item, :count).by(1)
#       end

#       it "assigns a newly created item as @item" do
#         post :create, {:item => valid_attributes}, valid_session
#         assigns(:item).should be_a(Item)
#         assigns(:item).should be_persisted
#       end

#       it "redirects to the created item" do
#         post :create, {:item => valid_attributes}, valid_session
#         response.should redirect_to(Item.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved item as @item" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Item.any_instance.stub(:save).and_return(false)
#         post :create, {:item => { "available" => "invalid value" }}, valid_session
#         assigns(:item).should be_a_new(Item)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Item.any_instance.stub(:save).and_return(false)
#         post :create, {:item => { "available" => "invalid value" }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested item" do
#         item = FactoryGirl.create(:item)
#         # Assuming there are no other items in the database, this
#         # specifies that the Item created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Item.any_instance.should_receive(:update).with({ "available" => "false" })
#         put :update, {:id => item.to_param, :item => { "available" => "false" }}, valid_session
#       end

#       it "assigns the requested item as @item" do
#         item = FactoryGirl.create(:item)
#         put :update, {:id => item.to_param, :item => valid_attributes}, valid_session
#         assigns(:item).should eq(item)
#       end

#       it "redirects to the item" do
#         item = FactoryGirl.create(:item)
#         put :update, {:id => item.to_param, :item => valid_attributes}, valid_session
#         response.should redirect_to(item)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the item as @item" do
#         item = FactoryGirl.create(:item)
#         # Trigger the behavior that occurs when invalid params are submitted
#         Item.any_instance.stub(:save).and_return(false)
#         put :update, {:id => item.to_param, :item => { "available" => "invalid value" }}, valid_session
#         assigns(:item).should eq(item)
#       end

#       it "re-renders the 'edit' template" do
#         item = FactoryGirl.create(:item)
#         # Trigger the behavior that occurs when invalid params are submitted
#         Item.any_instance.stub(:save).and_return(false)
#         put :update, {:id => item.to_param, :item => { "available" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested item" do
#       item = FactoryGirl.create(:item)
#       expect {
#         delete :destroy, {:id => item.to_param}, valid_session
#       }.to change(Item, :count).by(-1)
#     end

#     it "redirects to the items list" do
#       item = FactoryGirl.create(:item)
#       delete :destroy, {:id => item.to_param}, valid_session
#       response.should redirect_to(items_url)
#     end
#   end

# end

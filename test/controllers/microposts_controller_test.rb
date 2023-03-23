# require 'test_helper'
# class MicropostsControllerTest < ActionDispatch::IntegrationTest
#     def setup
#         @base_title = "Toy App"
#     end

#     test "should get index" do
#         get microposts_path
#         assert_response :success
#         assert_select "title", "Dashboard | #{@base_title}"
#     end
#     test "should get new" do
#         get new_micropost_path
#         assert_response :success
#         assert_select "title", "Add Toy | #{@base_title}"
#     end
#     test "should get edit" do
#         get edit_micropost_path
#         assert_response :success
#         assert_select "title", "Edit Toy | #{@base_title}"
#     end
# end
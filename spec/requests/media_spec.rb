require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/media" do
  before(:each) do
    @response = request("/media")
  end
end
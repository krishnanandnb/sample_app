require 'spec_helper'
describe "UserPages" do
	subject {page}
  describe "signup page" do
  	before {visit "/signup"}
  	it { should have_selector("h1", text:"Sign up") }
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

  end
end

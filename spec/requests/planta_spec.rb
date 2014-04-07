require 'spec_helper'

describe "Planta" do
  describe "GET /planta" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get planta_path
      response.status.should be(200)
    end
  end
end

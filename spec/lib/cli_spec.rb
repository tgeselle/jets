require "spec_helper"

# to run specs with what"s remembered from vcr
#   $ rake
#
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe Jets::CLI do
  before(:all) do
    @args = "--noop"
  end

  describe "jets" do
    it "build" do
      out = execute("bin/jets build #{@args}")
      # puts out
      expect(out).to include("Building project")
    end

    it "deploy" do
      out = execute("bin/jets deploy #{@args}")
      # puts out
      expect(out).to include("Deploying project")
    end

    it "delete" do
      out = execute("bin/jets delete #{@args}")
      # puts out
      expect(out).to include("Deleting project")
    end

    it "new" do
      out = execute("bin/jets new demo #{@args}")
      # puts out
      expect(out).to include("Creating new project called demo.")
    end

    it "routes" do
      out = execute("bin/jets routes #{@args}")
      # puts out
      # header
      expect(out).to include("Verb")
      expect(out).to include("Path")
    end

    it "call" do
      out = execute("bin/jets call #{@args}")
      puts out
      expect(out).to include("Calling lambda function on AWS")
    end
  end
end

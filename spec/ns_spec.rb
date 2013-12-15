require 'spec_helper'
describe Clj::New::Ns do
  describe "namespace_to_fileparts" do
    it "splits the namespace by . and replaces - with _" do
      expect(Clj::New::Ns.namespace_to_fileparts("little-world.hello")).to eq(["little_world", "hello"])
    end
  end

  describe "src_filename_from_namespace" do
    it "returns a relative filepath for the source file" do
      expect(Clj::New::Ns.src_file_for_ns("little-world.hello")).to eq("src/little_world/hello.clj")
    end
  end

  describe "spec_filename_from_namespace" do
    it "returns a relative filepath for spec file" do
      expect(Clj::New::Ns.spec_file_for_ns("little-world.hello")).to eq("spec/little_world/hello_spec.clj")
    end
  end

  describe "src_file_content_for_ns" do
    it "returns the contents of the src file" do
      expect(Clj::New::Ns.src_file_content_for_ns("little-world.hello")).to eq("(ns little-world.hello)")
    end
  end

  describe "spec_file_content_for_ns" do
    it "returns the contents of the spec file" do
      expected = <<-speccontent
(ns little-world.hello-spec
  (:require [little-world.hello :refer :all]))
speccontent
      expect(Clj::New::Ns.spec_file_content_for_ns("little-world.hello")).to eq(expected)
    end
  end
end

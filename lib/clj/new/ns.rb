require "clj/new/ns/version"

module Clj
  module New
    module Ns
      def self.namespace_to_fileparts(ns)
        ns.gsub("-", "_").split(".")
      end

      def self.src_file_for_ns(ns)
        "src/#{namespace_to_fileparts(ns).join("/")}.clj"
      end

      def self.spec_file_for_ns(ns)
        "spec/#{namespace_to_fileparts(ns).join("/")}_spec.clj"
      end

      def self.src_file_content_for_ns(ns)
        "(ns #{ns})"
      end

      def self.spec_file_content_for_ns(ns)
        <<-r
(ns #{ns}-spec
  (:require [#{ns} :refer :all]))
r
      end
    end
  end
end

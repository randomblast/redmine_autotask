module RedmineAutotask
  module ChangesetPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :after_create, :autotask
      end
    end

    module InstanceMethods
      def after_create_with_autotask
        after_create_without_autotask
        f = File.open("/tmp/autotask", "a")
        f.puts self.changes.find(:all).inspect
        f.close
      end
    end
  end
end

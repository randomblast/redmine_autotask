module ChangesetPatch
  def self.included(base)
    base.send(:include, InstanceMethods)

    base.class_eval do
      after_create :look_at_source_files
  end

  module InstanceMethods
    def look_at_source_files
      p self
    end
  end
end

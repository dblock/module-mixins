module Module::Mixins::Included
  attr_accessor :classes_including

  def included(base)
    self.classes_including ||= []
    self.classes_including << base
  end
end

module Module::Mixins::Including
  def classes_including
    ::Module::Mixins::Including.classes_including self
  end

  def self.classes_including(klass)
    ::Module.constants.map do |k|
      next if k == k.upcase
      c = Object.const_get k
      next c if klass > c
    end.compact
  end
end

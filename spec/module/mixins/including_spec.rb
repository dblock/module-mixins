require 'spec_helper'

describe Module::Mixins::Including do
  context 'a class including a module' do
    before do
      @m = Module.new do
        extend Module::Mixins::Including
      end
      @k = Class.new
      @k.send :include, @m
      Object.const_set "Class_#{SecureRandom.uuid.delete('-')}", @k
    end
    it 'classes_including' do
      expect(@m.classes_including).to eq [@k]
      expect(@m.classes_including.first.new).to be_a_kind_of @k
    end
    context 'inherited' do
      before do
        @child = Class.new(@k)
        Object.const_set "Class_#{SecureRandom.uuid.delete('-')}", @child
      end
      it 'classes_including includes children' do
        expect(@m.classes_including.sort).to eq [@k, @child].sort
        @child.send :include, @m
      end
    end
  end
  context 'Enumerable' do
    before do
      Enumerable.extend Module::Mixins::Including
    end
    it 'classes_including' do
      expect(Enumerable.classes_including).to include Array
    end
  end
  context 'module classes_including' do
    it 'Enumerator' do
      expect(Module::Mixins::Including.classes_including(Comparable)).to include String
    end
  end
end

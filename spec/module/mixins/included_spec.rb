require 'spec_helper'

describe Module::Mixins::Included do
  context 'a class including a module' do
    before do
      @m = Module.new do
        extend Module::Mixins::Included
      end
      @k = Class.new
      @k.send :include, @m
    end
    it 'classes_including' do
      expect(@m.classes_including).to eq [@k]
      expect(@m.classes_including.first.new).to be_a_kind_of @k
    end
    context 'inherited' do
      before do
        @child = Class.new(@k)
      end
      it 'classes_including' do
        expect(@m.classes_including).to eq [@k]
      end
    end
  end
end

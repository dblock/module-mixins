Module::Mixins
==============

[![Gem Version](http://img.shields.io/gem/v/module-mixins.svg)](http://badge.fury.io/rb/module-mixins)
[![Build Status](http://img.shields.io/travis/dblock/module-mixins.svg)](https://travis-ci.org/dblock/module-mixins)
[![Dependency Status](https://gemnasium.com/dblock/module-mixins.svg)](https://gemnasium.com/dblock/module-mixins)
[![Code Climate](https://codeclimate.com/github/dblock/module-mixins.svg)](https://codeclimate.com/github/dblock/module-mixins)

Help with inspecting mixed-in Ruby modules.

### Install

Add `module-mixins` to your Gemfile.

```
gem 'module-mixins'
```

### Use

#### Find All Classes that Include a Module

In order to find all classes that include a module you would typically track those via the [Module.included](http://ruby-doc.org/core-2.2.0/Module.html#method-i-included) callback.

```ruby
module MyModule
  attr_accessor :classes_including

  def included(base)
    self.classes_including ||= []
    self.classes_including << base
  end
end
```

This works well and is the behavior implemented in _module-mixins_ by [Module::Mixins::Included](lib/module/mixins/included.rb). You can `extend` your modules instead of duplicating code.

```ruby
module MyModule
  extend Module::Mixins::Included
end
```

Ruby also provides a mechanism to enumerate all constants, which enables us to find mixed-in modules dynamically.

You can extend a module and call `classes_including` similarly.

```ruby
module MyModule
  extend Module::Mixins::Including
end
```

You can also extend existing modules, which is quite powerful because you can apply it to modules you have not declared in your own code.

```ruby
irb> Enumerable.extend Module::Mixins::Including
 => Enumerable

irb> Enumerable.classes_including
 => [Array, Hash, Struct, ..., Set, SortedSet]
```

You can also use a module method without needing to mix-in another module.

```ruby
irb> Module::Mixins::Including.classes_including(Comparable)
 => [String, Symbol, Numeric, ..., Date, DateTime]
```

### References

* https://www.ruby-forum.com/topic/163430
* http://stackoverflow.com/questions/3917857/getting-a-list-of-classes-that-include-a-module

### Contribute

See [CONTRIBUTING](CONTRIBUTING.md).

### Copyright and License

Copyright Daniel Doubrovkine and Contributors, Artsy Inc., 2015

[MIT License](LICENSE.md)

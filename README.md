# Super Hash [![Build Status](https://secure.travis-ci.org/Soliah/super_hash.png)](http://travis-ci.org/Soliah/super_hash?branch=master)

Provides a way to wrap the standard Ruby hash in a struct like object that supports arbitrary nesting, whilst
maintaining the original Hash interface.

## Install

Add the following to your Gemfile:

```
gem 'super_hash', :git => 'git://github.com/Soliah/super_hash.git'
```

## Usage

Simply `require 'super_hash'` where you need it.

### Examples

Say you have the following hash:

```
hash = SuperHash.new({ 'test' =>
         { 'x' => 7,
           'yellow' => [{'b' => 'hello'}, {'c' => 'onetwo'}]
         }
       })
```

With SuperHash, you can do this:

```
hash.test => { 'x' => 7, 'yellow' => [{'b' => 'hello'}, {'c' => 'onetwo'}]
hash.test.x => 7
hash[:test].yellow[0].b => 'hello'
```

## License

(The MIT License)

Copyright (c) 2012 Christopher Chow, Carl Woodward

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

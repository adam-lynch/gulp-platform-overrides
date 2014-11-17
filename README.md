gulp-platform-overrides 
==========

[![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Windows Build Status][appveyor-image]][appveyor-url] [![Dependency Status][depstat-image]][depstat-url] 

---

A [Gulp](http://github.com/gulpjs/gulp) plugin for applying platform-specific manifest values. Simply a Gulp wrapper for [platform-overrides](http://github.com/adam-lynch/platform-overrides).

# Installation
```js
npm install gulp-platform-overrides
```

# Usage
```js
var gulp = require('gulp');
var platformOverrides = require('gulp-platform-overrides');

gulp.task('prepare', function() {
    gulp.src('./package.json')
        .pipe(platformOverrides({platform: 'osx'}) // if platform is missing, then it is auto-detected
        .pipe(gulp.dest('./dist'));
});

gulp.task('default', ['prepare']);
```

## Options

The options are the same as [platform-overrides](http://github.com/adam-lynch/platform-overrides), except the `options` property (the manifest) isn't supported as it is passed down the stream here.

## Issues

Please report any issues at [platform-overrides](http://github.com/adam-lynch/platform-overrides).

## Example

Example manifest:

```json
{
  "name": "nw-demo",
  "version": "0.1.0",
  "main": "index.html",
  "window": {
      "frame": false,
      "toolbar": false
  },
  "platformOverrides": {
      "win": {
          "window": {
              "frame": true
          }
      },
      "osx": {
          ...
      },
      "linux32": {
          ...
      },
      "linux64": {
          ...
      },
  }
}
```

For example, when building for Windows, the manifest generated and put into the end app (from the manifest above) would be:

```json
{
    "name": "nw-demo",
    "version": "0.1.0",
    "main": "index.html",
    "window": {
        "frame": true,
        "toolbar": false
    }
}
```


## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

[npm-url]: https://npmjs.org/package/gulp-platform-overrides
[npm-image]: http://img.shields.io/npm/v/gulp-platform-overrides.svg?style=flat

[travis-url]: http://travis-ci.org/adam-lynch/gulp-platform-overrides
[travis-image]: http://img.shields.io/travis/adam-lynch/gulp-platform-overrides.svg?style=flat

[appveyor-url]: https://ci.appveyor.com/project/adam-lynch/gulp-platform-overrides/branch/master
[appveyor-image]: https://ci.appveyor.com/api/projects/status/ok9243bf4q7mom55/branch/master?svg=true

[depstat-url]: https://david-dm.org/adam-lynch/gulp-platform-overrides
[depstat-image]: https://david-dm.org/adam-lynch/gulp-platform-overrides.svg?style=flat

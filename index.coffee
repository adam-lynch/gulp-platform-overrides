platformOverrides = require 'platform-overrides'
_ = require 'lodash'
through = require 'through2'
gutil = require 'gulp-util'
PluginError = gutil.PluginError
pluginName = 'gulp-platform-overrides'

module.exports = (options) ->

    through.obj (file, enc, cb) ->
        # pass through null filese
        if file.isNull()
            cb null, file
            return

        # don't support stream for now
        if file.isStream()
            cb new PluginError pluginName, 'Streaming not supported'
            return

        if options
            args = _.clone options, true
        else
            args = {}
        args.options = file.contents.toString()

        self = this
        platformOverrides args, (err, result) ->
            if err
                cb result, null
                return

            file.contents = new Buffer result
            self.push file

            cb()
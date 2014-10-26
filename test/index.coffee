chai = require 'chai'
expect = chai.expect
fs = require 'fs'
globToVinyl = require 'glob-to-vinyl'
platformOverrides = require '../index.coffee'

describe 'gulp-platform-overrides', ->

    it "should wrap platform-overrides correctly", (done) ->
        stream = platformOverrides
            platform: 'osx'

        stream.on 'end', ->
            done()

        globToVinyl './test/fixtures/package.json', (err, files) ->
            throw err if err

            fixture = files[0]

            stream.on 'data', (file) ->
                expect(file.path).to.equal(fixture.path)
                expect(file.cwd).to.equal(fixture.cwd)
                expect(file.base).to.equal(fixture.base)

                expect(
                    JSON.parse file.contents.toString()
                ).to.deep.equal(
                    JSON.parse fs.readFileSync('./test/expected/osx.json').toString()
                )

            stream.write fixture
            stream.end()

    it "should work if arguments aren't passed", (done) ->
        stream = platformOverrides()

        stream.on 'end', ->
            done()

        globToVinyl './test/fixtures/package.json', (err, files) ->
            throw err if err
            stream.on 'data', ->
            stream.write files[0]
            stream.end()